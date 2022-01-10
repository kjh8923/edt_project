<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
<%
	Connection conn=null;
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
		
	Boolean connect = false;
		
	try{
	    Class.forName(driver);
	    conn = DriverManager.getConnection(url,"scott","tiger"); 
	    //자신의 아이디와 비밀번호
	    connect = true;
	    
	}catch(Exception e){
	    connect = false;
	    e.printStackTrace();
	}

	if(connect==true){
    	System.out.println("데이터 베이스 연결성공");
	}else{ 
    	System.out.println("데이터 베이스 연결실패");
	}
%>