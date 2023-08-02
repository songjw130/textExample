<%@include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>midify</title>
</head>
<body>
<script type="text/javascript" src="check.js"></script>

<jsp:include page="header.jsp"></jsp:include>

<section style="position: fixed; top: 70px; left: 0px; width: 100%; height: 100%;
				background-color: lightgray">
<h2 style="text-align: center;"><b>교과목 수정 IF</b></h2>

<form method="post" action="action.jsp" name="frm" style="display: flex; align-items: center; justify-content: center; text-align: center;">
<input type="hidden" name="mode" value="modify">

<table border="1">

<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id"); //변수 선언 외부파일(ex: jsp)로부터 데이터를 받음

try {
	String sql ="SELECT * FROM cource_tbl WHERE id = ?";  //모르기 때문에 ? 표시	 
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id); // 1번 ? 는 id이다	1번 parameter 2번 parameter ....
	ResultSet rs = pstmt.executeQuery(); //참고 HRD300 i_action
	rs.next(); //1행의 결과만 불러오기 때문에
	String lecturer = rs.getString(4);
	String week = rs.getString(5);
	
	String start_hour = rs.getString(6);
	if(start_hour.length()<4) {
		start_hour = "0" + start_hour;
	}
	
	String end_hour = rs.getString(7);
	while(end_hour.length()<4) {
		end_hour = "0" + end_hour;
	}
	
%>	
<tr>
<td>과목 코드</td>
<td><input type="text" name="id" value="<%=id%>" style="width: 100%" readonly></td> <!-- id는 자바에서 가져옴 -->
</tr>

<tr>
<td>과목명</td>
<td><input type="text" name="name" value="<%=rs.getString(2)%>" style="width: 100%;"></td>
</tr>

<tr>
<td>학점</td>
<td><input type="text" name="credit" value="<%=rs.getString(3)%>" style="width: 100%;"></td>
</tr>

<tr>
<td>담당강사</td>
<td>
<select name="lecturer" style="width: 100%">
<option value="">담당강사선택</option>
<option value="1" <% if(lecturer.equals("1")) out.println("selected");%>> 김교수</option> <!-- HRD300 slist 참고 out.println 결과 보여주는 행위-->
<option value="2" <% if(lecturer.equals("2")) out.println("selected");%>> 이교수</option>
<option value="3" <% if(lecturer.equals("3")) out.println("selected");%>> 박교수</option>
<option value="4" <% if(lecturer.equals("4")) out.println("selected");%>> 우교수</option>
<option value="5" <% if(lecturer.equals("5")) out.println("selected");%>> 최교수</option>
<option value="6" <% if(lecturer.equals("6")) out.println("selected");%>> 임교수</option>
</select>
</td>
</tr>

<tr>
<td>요일</td>
<td>
<input type="radio" name="week" value="1" <% if(week.equals("1")) out.println("checked");%>>월 <!-- value는 데이터베이스에 입력된 값 -->
<input type="radio" name="week" value="2" <% if(week.equals("2")) out.println("checked");%>>화 <!-- radio는 name 모두 동일 -->
<input type="radio" name="week" value="3" <% if(week.equals("3")) out.println("checked");%>>수
<input type="radio" name="week" value="4" <% if(week.equals("4")) out.println("checked");%>>목
<input type="radio" name="week" value="5" <% if(week.equals("5")) out.println("checked");%>>금
</td>
</tr>

<tr>
<td>시작 시간</td>
<td><input type="text" name="start_hour" value="<%=start_hour%> "style="width: 100%;"></td>
</tr>

<tr>
<td>종료 시간</td>
<td><input type="text" name="end_hour" value="<%=end_hour%> "style="width: 100%;"></td>
</tr>

<tr>
<td colspan="2">
<input type="button" value="수정" onClick="return modify()"> <!-- return 안써도 됌 -->
<input type="button" value="취소" onClick="res()">
</tr>

<%
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