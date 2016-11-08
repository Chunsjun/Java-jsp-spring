import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// '/viewUser'
public class ViewUserServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();

		ArrayList<Map> list = new ArrayList<Map>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		String id = (String) session.getAttribute("id");
		int num = (int) session.getAttribute("num");

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "mybatis", "mybatis$");
			preparedStatement = connection.prepareStatement("SELECT * FROM MEMBER WHERE MEMBER_ID = ? AND MEMBER_NUM = ?");
			preparedStatement.setString(1, id);
			preparedStatement.setInt(2, num);

			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				int mNum = resultSet.getInt("MEMBER_NUM");
				String mId = resultSet.getString("MEMBER_ID");
				String name = resultSet.getString("NAME");
				int age = resultSet.getInt("AGE");
				String mail = resultSet.getString("MAIL");
				String password = resultSet.getString("PASSWORD");

				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("mNum", mNum);
				map.put("mId", mId);
				map.put("name", name);
				map.put("age", age);
				map.put("mail", mail);
				map.put("password", password);

				list.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				resultSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("member", list);

		String url = "/WEB-INF/jsp/viewUser.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
