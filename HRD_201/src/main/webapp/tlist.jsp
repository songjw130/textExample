<%@page import="java.text.DecimalFormat"%>
<%@ include file="db.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tlist</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<section style="position: fixed; top: 70px; left: 0px; width: 100%; height: 100%; background-color: lightgray;">
<h2 style="text-align: center;">강사조회</h2>

<form style="display: flex; align-items: center; justify-content: center; text-align: center;">
<table border="1">

<tr>
<td>강사코드</td>
<td>강사명</td>
<td>강의명</td>
<td>수강료</td>
<td>강사자격취득일</td>
</tr>

<%
request.setCharacterEncoding("utf-8");

try {
	String sql="select* from tbl_teacher_202201 order by teacher_code";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery(); //결과 집합
	while(rs.next()) {
		int class_price = rs.getInt(4); // select 4번째 칼럼을 불러옴
		DecimalFormat transformat = new DecimalFormat("￦ ###,###,###"); //원 표시 및 천자리 표시
		String price = transformat.format(class_price); //class_price를 포멧한 것을 price에 대입
		
		String teach_resist_date = rs.getString(5); // select 5번째 칼럼을 불러옴
		String date = teach_resist_date.substring(0,4)+"년" + teach_resist_date.substring(4,6) + "월" + teach_resist_date.substring(6,8) + "일";
		//substring(시작, 끝+1)
		%> 
	
	<tr>
	<td style="width: 150px;"> <%=rs.getString(1) %></td>
	<td style="width: 150px;"> <%=rs.getString(2) %></td>
	<td style="width: 150px;"> <%=rs.getString(3) %></td>
	<td style="width: 150px;"> <%=price %></td>
	<td style="width: 150px;"> <%=date %></td>
	</tr>
	
	<%
	}
	
}	
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