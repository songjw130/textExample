<%@ include file="db.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");

String stuid = request.getParameter("stuid"); //외부파일(ex: jsp)로부터 데이터를 받음
String subcode = request.getParameter("subcode");
String midscore = request.getParameter("midscore");
String finalscore = request.getParameter("finalscore");
String attend = request.getParameter("attend");
String report = request.getParameter("report");
String etc = request.getParameter("etc");

try {
	String sql = "INSERT INTO tbl_score_202210 values (?,?,?,?,?,?,?)"; //모르기 때문에 ? 표시
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, stuid); // 1번 ? 는 stuid이다
	pstmt.setString(2, subcode); // 2번 ? 는 subcode이다
	pstmt.setString(3, midscore); // 3번 ? 는 midscore이다
	pstmt.setString(4, finalscore); // 4번 ? 는 finalscore이다
	pstmt.setString(5, attend); // 5번 ? 는 attend이다
	pstmt.setString(6, report); // 6번 ? 는 report이다
	pstmt.setString(7, etc); // 7번 ? 는 7는 etc이다
	
	pstmt.executeUpdate();
}

catch(Exception e) {
	e.printStackTrace();
}

%>

<jsp:forward page="insert.jsp"></jsp:forward>


