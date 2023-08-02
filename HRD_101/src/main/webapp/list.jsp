<%@include file="db.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<section style= "position: fixed; top: 70px; left: 0px; width: 100%; height: 100%;
				background-color: lightgray">

<h2 style="text-align: center">회원목록조회/수정 HRD103</h2>

<form name="frm" style="display: flex; align-items: center; justify-content: center; text-align: center">

<table border="1">

<tr>
<td>회원번호</td>
<td>회원성명</td>
<td>전화번호</td>
<td>주소</td>
<td>가입일자</td>
<td>고객등급</td>
<td>거주지역</td>
</tr>

<%
request.setCharacterEncoding("UTF-8");

try {
	String sql ="SELECT * FROM member_tbl_02";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()) {
	
	String grade = rs.getString(6);	
	if(grade.equals("A")) grade="VIP";	
	else if(grade.equals("B")) grade="일반";
	else grade="직원";	
	
	String joindate = rs.getString(5);
	String joindate2 = joindate.substring(0, 10);
%>

<tr>
<td> <a href="modify.jsp?mod_custno=<%=rs.getString(1)%>"> <%=rs.getString(1)%></a> </td>
<td> <%=rs.getString(2)%> </td>
<td> <%=rs.getString(3)%> </td>
<td> <%=rs.getString(4)%> </td>
<td> <%=joindate2%> </td>
<td> <%=grade%> </td>
<td> <%=rs.getString(7)%> </td>
</tr>

<%		
	} //while
	
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