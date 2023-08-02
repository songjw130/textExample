<%@page import="java.text.DecimalFormat"%>
<%@ include file="db.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>salary</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<section style="position: fixed; top: 70px; left: 0px; width: 100%; height: 100%; background-color: lightgray;">
<h2 style="text-align: center;">강사매출현황</h2>

<form style="display: flex; align-items: center; justify-content: center; text-align: center;">

<table border="1">

<tr>
<td style="width: 150px;">강사코드</td>
<td style="width: 150px;">강의명</td>
<td style="width: 150px;">강사명</td>
<td style="width: 150px;">총매출</td>
</tr>

<%
request.setCharacterEncoding("utf-8"); //한글을 지원하는 utf-8 인코딩

try{
	String sql = "select te.teacher_code, class_name, teacher_name, sum(tuition) salary " +
				 "from tbl_teacher_202201 te , tbl_class_202201 cl " +
				 "where te.teacher_code=cl.teacher_code " +
				 "group by te.teacher_code, class_name, teacher_name " + //select 절과 동일 집계 함수 제외
				 "order by te.teacher_code";
				 				
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery(); //결과 집합
	while(rs.next()) {
		int salary = rs.getInt(4);		
		DecimalFormat transformat = new DecimalFormat("￦ ###,###,###"); //"￦ ###,###,###.00") 소숫점 두자리 표기
		String salary2 = transformat.format(salary);		
	%>
	<!-- 자바에서 값을 받는 HTML 부분 -->
	<tr>
	<td><%=rs.getString(1) %></td>
	<td><%=rs.getString(2) %></td>
	<td style="text-align: right;"><%=rs.getString(3) %></td>
	<td style="text-align: right;"><%=salary%></td>
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