import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// '/writeBoard'
public class WriteBoardServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "/WEB-INF/jsp/writeBoard.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

	@SuppressWarnings("resource")
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "mybatis", "mybatis$");
			preparedStatement = connection.prepareStatement("select SYSDATE from DUAL");
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				int sysdate = resultSet.getInt("SYSDATE");

				preparedStatement = connection.prepareStatement(
						"insert into BOARD (BOARD_NUM, BOARD_WRITER, BOARD_DATE, BOARD_TITLE, BOARD_CONTENTS) "
								+ "values (BOARD_SEQ.NEXTVAL,?,?,?,?)");
				preparedStatement.setString(1, name);
				preparedStatement.setInt(2, sysdate);
				preparedStatement.setString(3, title);
				preparedStatement.setString(4, contents);

				resultSet = preparedStatement.executeQuery();

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

		String url = "/viewBoard";
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
