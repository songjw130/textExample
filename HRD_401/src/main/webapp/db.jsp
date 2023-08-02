<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>db</title>
</head>
<body>

<%
Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection
("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
%>

</body>
</html>