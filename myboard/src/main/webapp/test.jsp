<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*"%>
<!-- JSP���� JDBC�� ��ü�� ����ϱ� ���� java.sql ��Ű���� import �Ѵ� -->


<html>

<head></head>

<body>

	<table width="550" border="1">

		<%
			Connection conn = null; // null�� �ʱ�ȭ �Ѵ�.

			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				String url = "jdbc:log4jdbc:mysql://127.0.0.1:3306/chunsjun"; // ����Ϸ��� �����ͺ��̽����� ������ URL ���

				String id = "chunsjun"; // ����� ����

				String pw = "a153d426"; // ����� ������ �н�����

				Class.forName("com.mysql.jdbc.Driver"); // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.

				conn = DriverManager.getConnection(url, id, pw); // DriverManager ��ü�κ��� Connection ��ü�� ���´�.

				String sql = "select * from tbl_board where writer = ?"; // sql ����

				pstmt = conn.prepareStatement(sql); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.

				pstmt.setString(1, "������");

				rs = pstmt.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�.

				while (rs.next()) { // ����� �� �྿ ���ư��鼭 �����´�.

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

			} catch (Exception e) { // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.

				e.printStackTrace();

				out.println("member ���̺� ȣ�⿡ �����߽��ϴ�.");

			} finally { // ������ ���� �Ǵ� ���п� ������� ����� �ڿ��� ���� �Ѵ�.  (�����߿�)

				if (rs != null)
					try {
						rs.close();
					} catch (SQLException sqle) {
					} // Resultset ��ü ����

				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException sqle) {
					} // PreparedStatement ��ü ����

				if (conn != null)
					try {
						conn.close();
					} catch (SQLException sqle) {
					} // Connection ����

			}
		%>

	</table>

</body>

</html>
