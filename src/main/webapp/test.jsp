<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>emp</h1>
	<table border="1">
		<tr>
			<th>empno</th>
			<th>ename</th>
			<th>job</th>
			<th>sal</th>
			
		</tr>
		<%@include file="dbconn.jsp"%>
		<% 
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			// 3) SQL문 준비
			String sql = "SELECT * FROM emp";
			pstmt = conn.prepareStatement(sql);
			

			// 4) 실행
			rs = pstmt.executeQuery();

			// 5) 결과를 테이블에 출력
			while (rs.next()) {
				String empno = rs.getString("empno");
				String ename = rs.getString("ename");
				String job = rs.getString("job");
		%>
		<tr>
			<td><%=empno%></td>
			<td><%=ename%></td>
			<td><%=job%></td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		// JDBC 자원 닫기
		rs.close();
		pstmt.close();
		conn.close();
	%>
</body>