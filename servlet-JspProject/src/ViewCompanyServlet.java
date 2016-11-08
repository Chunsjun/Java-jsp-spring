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

public class ViewCompanyServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");

		ArrayList<Map> list = new ArrayList<Map>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		HttpSession session = request.getSession();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "mybatis", "mybatis$");
			preparedStatement = connection.prepareStatement("select COM_TITLE,COM_CONTENTS from COMPANY");

			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				String title = resultSet.getString("COM_TITLE");
				String contents = resultSet.getString("COM_CONTENTS");

				session.setAttribute("title", title);
				session.setAttribute("contents", contents);
				
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("title", title);
				map.put("contents", contents);

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
		request.setAttribute("company", list);

		String url = "/WEB-INF/jsp/viewCompany.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		ArrayList<Map> list = new ArrayList<Map>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "mybatis", "mybatis$");
			preparedStatement = connection.prepareStatement("select COM_TITLE,COM_CONTENTS from COMPANY");

			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				String title = resultSet.getString("COM_TITLE");
				String contents = resultSet.getString("COM_CONTENTS");

				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("title", title);
				map.put("contents", contents);

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
		request.setAttribute("company", list);

		String url = "/WEB-INF/jsp/viewCompany.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
