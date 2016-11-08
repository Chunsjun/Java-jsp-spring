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

public class ViewBoardServlet  extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		
		ArrayList<Map> list = new ArrayList<Map>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "mybatis", "mybatis$");
			preparedStatement = connection.prepareStatement("select BOARD_NUM, BOARD_WRITER, BOARD_TITLE, BOARD_DATE from BOARD ORDER BY BOARD_NUM");

			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				int bNum = resultSet.getInt("BOARD_NUM");
				String bWriter = resultSet.getString("BOARD_WRITER");
				String bTitle = resultSet.getString("BOARD_TITLE");
				String bDate = resultSet.getString("BOARD_DATE");

				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("bNum", bNum);
				map.put("bWriter", bWriter);
				map.put("bTitle", bTitle);
				map.put("bDate", bDate);

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
		request.setAttribute("board", list);

		String url = "/WEB-INF/jsp/viewBoard.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	
	}
}
