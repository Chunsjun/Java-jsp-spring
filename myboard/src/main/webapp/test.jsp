<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*"%>
<!-- JSP에서 JDBC의 객체를 사용하기 위해 java.sql 패키지를 import 한다 -->


<html>

<head></head>

<body>

	<table width="550" border="1">

		<%
			Connection conn = null; // null로 초기화 한다.

			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				String url = "jdbc:log4jdbc:mysql://127.0.0.1:3306/chunsjun"; // 사용하려는 데이터베이스명을 포함한 URL 기술

				String id = "chunsjun"; // 사용자 계정

				String pw = "a153d426"; // 사용자 계정의 패스워드

				Class.forName("com.mysql.jdbc.Driver"); // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.

				conn = DriverManager.getConnection(url, id, pw); // DriverManager 객체로부터 Connection 객체를 얻어온다.

				String sql = "select * from tbl_board where writer = ?"; // sql 쿼리

				pstmt = conn.prepareStatement(sql); // prepareStatement에서 해당 sql을 미리 컴파일한다.

				pstmt.setString(1, "관리자");

				rs = pstmt.executeQuery(); // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.

				while (rs.next()) { // 결과를 한 행씩 돌아가면서 가져온다.

					 id = rs.getString("bno");

					 pw = rs.getString("title");

					String name = rs.getString("content");

		%>


		<tr>

			<td width="100"><%=id%></td>

			<td width="100"><%=pw%></td>

			<td width="100"><%=name%></td>


		</tr>

		<%
			}

			} catch (Exception e) { // 예외가 발생하면 예외 상황을 처리한다.

				e.printStackTrace();

				out.println("member 테이블 호출에 실패했습니다.");

			} finally { // 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다.  (순서중요)

				if (rs != null)
					try {
						rs.close();
					} catch (SQLException sqle) {
					} // Resultset 객체 해제

				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException sqle) {
					} // PreparedStatement 객체 해제

				if (conn != null)
					try {
						conn.close();
					} catch (SQLException sqle) {
					} // Connection 해제

			}
		%>

	</table>

</body>

</html>
