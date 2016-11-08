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

public class DeleteCartServlet  extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		response.setContentType("text/html;charset=utf-8");

		ArrayList<Map> list = new ArrayList<Map>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "mybatis", "mybatis$");
			preparedStatement = connection.prepareStatement(
					"select CART.BOOK_NUM AS BOOK_NUM, BOOK.BOOK_NAME AS BOOK_NAME, BOOK.AUTHOR AS AUTHOR, BOOK.PUBLISHER AS PUBLISHER, BOOK.BOOK_COST AS BOOK_COST, CART.AMOUNT AS AMOUNT,(AMOUNT*BOOK_COST)AS TOTAL from BOOK,CART where BOOK.BOOK_NUM = CART.BOOK_NUM AND CART.MEMBER_NUM = ?");

			preparedStatement.setInt(1, (int) session.getAttribute("num"));

			resultSet = preparedStatement.executeQuery();

				while (resultSet.next()) {
					int bNum = resultSet.getInt("BOOK_NUM");
					String bName = resultSet.getString("BOOK_NAME");
					String author = resultSet.getString("AUTHOR");
					String publisher = resultSet.getString("PUBLISHER");
					int bCost = resultSet.getInt("BOOK_COST");
					int cAmount = resultSet.getInt("AMOUNT");
					int total = resultSet.getInt("TOTAL");

					HashMap<String, Object> map = new HashMap<String, Object>();
					map.put("bNum", bNum);
					map.put("bName", bName);
					map.put("author", author);
					map.put("publisher", publisher);
					map.put("bCost", bCost);
					map.put("cAmount", cAmount);
					map.put("total", total);

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
		request.setAttribute("cart", list);

		String url = "/WEB-INF/jsp/deleteCart.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bNum = request.getParameter("bNum");
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "mybatis", "mybatis$");
			preparedStatement = connection.prepareStatement("delete from CART where BOOK_NUM=?");
			preparedStatement.setInt(1, Integer.valueOf(bNum));

			resultSet = preparedStatement.executeQuery();

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
		response.sendRedirect("/viewCart");
	}
}
