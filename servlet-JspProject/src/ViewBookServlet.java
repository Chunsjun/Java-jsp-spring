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

public class ViewBookServlet  extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		
		ArrayList<Map> list = new ArrayList<Map>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "mybatis", "mybatis$");
			preparedStatement = connection.prepareStatement("select BOOK_NUM,BOOK_NAME,BOOK_SUMMARY,AUTHOR,BOOK_DATE,PUBLISHER,BOOK_COST from BOOK ORDER BY BOOK_NUM");

			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				int bNum = resultSet.getInt("BOOK_NUM");
				String bName = resultSet.getString("BOOK_NAME");
				String bSum = resultSet.getString("BOOK_SUMMARY");
				String author = resultSet.getString("AUTHOR");
				String bDate = resultSet.getString("BOOK_DATE");
				String publisher = resultSet.getString("PUBLISHER");
				int bCost = resultSet.getInt("BOOK_COST");

				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("bNum", bNum);
				map.put("bName", bName);
				map.put("bSum", bSum);
				map.put("author", author);
				map.put("bDate", bDate);
				map.put("publisher", publisher);
				map.put("bCost", bCost);

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
		request.setAttribute("book", list);

		String url = "/WEB-INF/jsp/viewBook.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	
	}
}
