<%@include file="db.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");

String mode = request.getParameter("mode"); //외부파일(ex: jsp)로부터 데이터를 받음
String id = request.getParameter("id");
String name = request.getParameter("name");
String credit = request.getParameter("credit");
String lecturer = request.getParameter("lecturer");
String week = request.getParameter("week");
String start_hour = request.getParameter("start_hour");
String end_hour = request.getParameter("end_hour");


try {
	String sql ="";
	PreparedStatement pstmt = null;	
		
	if(mode.equals("insert")) {
	sql = "INSERT INTO cource_tbl VALUES (?,?,?,?,?,?,?)"; 	
	pstmt = con.prepareStatement(sql);	
	pstmt.setString(1, id);
	pstmt.setString(2, name);
	pstmt.setString(3, credit);
	pstmt.setString(4, lecturer);
	pstmt.setString(5, week);
	pstmt.setString(6, start_hour);
	pstmt.setString(7, end_hour);
	
	pstmt.executeUpdate();
	
%>
	<jsp:forward page="join.jsp"></jsp:forward>

<%	
	
	}
	else if(mode.equals("modify")) {
	sql="UPDATE cource_tbl SET name=?, credit=?, lecturer=?, week=?, start_hour=?, end_hour=? WHERE id=?";
	pstmt = con.prepareStatement(sql);	
	
	pstmt.setString(1, name); 
	pstmt.setString(2, credit);
	pstmt.setString(3, lecturer);
	pstmt.setString(4, week);
	pstmt.setString(5, start_hour);
	pstmt.setString(6, end_hour);
	pstmt.setString(7, id); // 7번 ? 는 id이다	1번 parameter 2번 parameter ....
	
	pstmt.executeUpdate();
	
%>	
	<jsp:forward page="modify.jsp"></jsp:forward>

<%	
	}
	else if(mode.equals("delete")) {
	sql = "DELETE FROM cource_tbl WHERE id=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	
	pstmt.executeUpdate();
		
%>
	<jsp:forward page="list.jsp"></jsp:forward>

<%	
	} //else if
} //try

catch(Exception e) {
	e.printStackTrace();
}
%>