<%@include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify</title>
</head>
<body>
<script type="text/javascript" src="check.js"></script>
<jsp:include page="header.jsp"></jsp:include>

<section style= "position: fixed; top: 70px; left: 0px; width: 100%; height: 100%;
				background-color: lightgray">

<h2 style="text-align: center">회원목록조회/수정 HRD199</h2>

<form method="post" action="action.jsp" name="frm" style="display: flex; align-items: center; justify-content: center; text-align: center">
<input type="hidden" name="mode" value="modify">

<table border="1">

<%
request.setCharacterEncoding("UTF-8");
String mod_custno = request.getParameter("mod_custno"); //변수 선언 외부파일(ex: jsp)로부터 데이터를 받음 자바(list페이지)에서 입력한 값

try{
	String sql = "SELECT * FROM member_tbl_02 WHERE custno=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, mod_custno);	
	ResultSet rs = pstmt.executeQuery();//결과 집합	
	rs.next();
		
		String grade = rs.getString(6);	
		if(grade.equals("A")) grade="VIP";	
		else if(grade.equals("B")) grade="일반";
		else grade="직원";	
		
		String joindate = rs.getString(5);
		String joindate2 = joindate.substring(0, 10);
%>

<tr>
<td>회원번호</td>
<td><input type="text" name="custno" value="<%=mod_custno%>" readonly> </td>
</tr>

<tr>
<td>회원성명</td>
<td><input type="text" name="custname" value="<%=rs.getString(2)%>"></td>
</tr>

<tr>
<td>전화번호</td>
<td><input type="text" name="phone" value="<%=rs.getString(3)%>"></td>
</tr>

<tr>
<td>주소</td>
<td><input type="text" name="address" value="<%=rs.getString(4)%>"></td>
</tr>

<tr>
<td>가입일자</td>
<td><input type="text" name="joindate" value="<%=joindate2%>"></td>
</tr>

<tr>
<td>고객등급[A:VIP,B:일반,C:직원]</td>
<td><input type="text" name="grade" value="<%=grade%>"></td>
</tr>

<tr>
<td>거주지역</td>
<td><input type="text" name="city" value="<%=rs.getString(7)%>"></td>
</tr>

<tr>
<td colspan="2">
<input type="button" value="수정" onClick="modify()">
<input type="button" value="조회" onClick="search()">
</td>

<%
	} //try

catch(Exception e) {
	e.printStackTrace();
}


%>

</table>

</form>

</section>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>