<%@include file="db.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");

String mode = request.getParameter("mode"); //외부파일(ex: jsp)로부터 데이터를 받음
String custno = request.getParameter("custno");
String custname = request.getParameter("custname");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String joindate = request.getParameter("joindate");
String grade = request.getParameter("grade");
String city = request.getParameter("city");


try {
	String sql = ""; //보내야하기 때문에 빈칸	
	PreparedStatement pstmt = null;
	
	switch(mode) {
	
	case "insert":
	sql = "INSERT INTO member_tbl_02 VALUES (?,?,?,?,?,?,?)";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, custno);
	pstmt.setString(2, custname);
	pstmt.setString(3, phone);	
	pstmt.setString(4, address);	
	pstmt.setString(5, joindate);	
	pstmt.setString(6, grade);	
	pstmt.setString(7, city); // 7번 ? 는 id이다	1번 parameter 2번 parameter ....
		
	pstmt.executeUpdate();			
	%>
	  <jsp:forward page="insert.jsp"/>
	<%
	break;
		
	case "modify":	
	sql = "UPDATE member_tbl_02 SET custname=?, phone=?, address=?, joindate=?, grade=?, city=? WHERE custno=?";
 	pstmt = con.prepareStatement(sql);

 	pstmt.setString(1, custname);
	pstmt.setString(2, phone);	
	pstmt.setString(3, address);	
	pstmt.setString(4, joindate);	
	pstmt.setString(5, grade);
	pstmt.setString(6, city);
	pstmt.setString(7, custno);	// 7번 ? 는 id이다	1번 parameter 2번 parameter ....
	
	pstmt.executeUpdate();		
	%>
  		<jsp:forward page="modify.jsp"/>
	<%
	break;
	
	} //switch
} //try

catch(Exception e) {
	e.printStackTrace();
} //catch


%>
    