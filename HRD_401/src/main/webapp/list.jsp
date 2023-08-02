<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.logging.SimpleFormatter"%>
<%@include file="db.jsp" %>
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

<section style="position: fixed; top: 70px; left: 0px; width: 100%; height: 100%;
				background-color: lightgray">
<h2 style="text-align: center;"><b>교과목 목록 IF</b></h2>

<form style="display: flex; align-items: center; justify-content: center; text-align: center;">

<table border="1">

<tr>
<td>과목코드</td>
<td>과목명</td>
<td>학점</td>
<td>담당강사</td>
<td>요일</td>
<td>시작시간</td>
<td>종료시간</td>
<td>삭제</td>
</tr>

<%
request.setCharacterEncoding("UTF-8");

try {
	String sql ="SELECT id, co.name, credit, le.name, week, start_hour, end_hour " +
				"FROM cource_tbl co, lecturer_tbl le "+
				"WHERE co.lecturer = le.idx " +
				"ORDER BY id";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()) {
					
	String day = rs.getString(5);
	
	switch(day) {	
	case "1":
		day = "월요일";
		break;
	case "2":
		day = "화요일";
		break;
	case "3":
		day = "수요일";
		break;
	case "4":
		day = "목요일";
		break;
	case "5":
		day = "금요일";
		break;		
	}
	
	String start_hour = rs.getString(6);
	if(start_hour.length()<4) {
		start_hour = "0" + start_hour; //while이나 if로 가능
	}
	
	String start_hour2 = start_hour.substring(0, 2) + "시" + start_hour.substring(2, 4) + "분";	
	
	
	String end_hour = rs.getString(7);
	while(end_hour.length()<4) {
		end_hour = "0" + end_hour;
	}
		
	String end_hour2 = end_hour.substring(0, 2) + "시" + end_hour.substring(2, 4) + "분";
	
%>
	
	<tr>
	<td><a href="modify.jsp?id=<%=rs.getString(1) %>"> <%=rs.getString(1) %></a></td> <!-- modify id와 내가 클릭한 rs.getString과 같으면 -->
	<td><%=rs.getString(2) %></td> <!-- 과목명(name) -->
	<td><%=rs.getString(3) %></td> <!-- 과목코드(credit) -->
	<td><%=rs.getString(4) %></td> <!-- 과목코드(id) -->
	<td><%=day %></td>
	<td><%=start_hour2 %></td>
	<td><%=end_hour2 %></td>
	<td><a href="action.jsp?id=<%=rs.getString(1) %>&mode=delete">삭제</a></td>
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