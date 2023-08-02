function add() {
	if(document.frm.resist_month.value.length==0) {
		alert("수강월이 입력되지 않았습니다.");
		frm.resist_month.focus();
		return false;
	}
	
	else if(document.frm.c_name.value.length==0) {     // else if 써도 됌
		alert("회원명이 입력되지 않았습니다.");
		frm.c_name.focus();
		return false;
	}
	
	else if(document.frm.class_area[0].checked==false && /*radio type */
	        document.frm.class_area[1].checked==false && 
	        document.frm.class_area[2].checked==false &&
            document.frm.class_area[3].checked==false &&
            document.frm.class_area[4].checked==false) {     
		alert("강의장소가 입력되지 않았습니다.");
		frm.class_area.focus();
		return false;
	}
	
	else if(document.frm.class_name.value==0) {     
		alert("강의명인 입력되지 않았습니다.");
		frm.class_name.focus();
		return false;
	}
	
	else
		alert("수강신청이 완료되었습니다!");
		document.frm.submit(); //데이터베이스로 데이터 보내기
		return true;
		
} //add

function res() {
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	document.frm.reset(); //작성한 데이터 초기화 하기
	
} //res

function getValue(c_no) { //select에서 선택된 value값을 c_no 변수로 가져옴
	document.getElementById("c_no").value = c_no; //c_no에 데이터 입력하기
	c_no2 = c_no; // 변수 선언
}

function getValue2(tuition) { //select에서 선택된 value값을 tuition 변수로 가져옴
	if(c_no2 >= 20000)	
	document.getElementById("tuition").value = tuition/2; //tuition에 데이터 입력하기
	
	else
	document.getElementById("tuition").value = tuition;
}










