function addCheck() {
	if(document.frm.id.value.length==0) { /* document 없어도 동작함 */
		alert("과목코드가 입력되지 않았습니다.");
		document.frm.id.focus();
		return false;
	}
	
	else if(document.frm.name.value.length==0) {
		alert("과목명이 입력되지 않았습니다.");
		document.frm.name.focus();
		return false;
	}
	
	else if(document.frm.credit.value.length==0) {
		alert("학점이 입력되지 않았습니다.");
		document.frm.credit.focus();
		return false;
	}
	
	else if(document.frm.lecturer.value==0) { /* length 없어도 동작함 */
		alert("담당강사가 입력되지 않았습니다.");
		document.frm.lecturer.focus();
		return false;
	}
	
	else if(document.frm.week[0].checked==false &&  /*value==0으로도 동작함*/
			document.frm.week[1].checked==false &&
			document.frm.week[2].checked==false &&
			document.frm.week[3].checked==false &&
			document.frm.week[4].checked==false) { 
		alert("요일이 선택되지 않았습니다.");
		document.frm.week.focus();
		return false;
	}
	
	else if(document.frm.start_hour.value.length==0) {
		alert("시작시간 입력되지 않았습니다.");
		document.frm.start_hour.focus();
		return false;
	}
	
	else if(document.frm.end_hour.value.length==0) {
		alert("종료시간 입력되지 않았습니다.");
		document.frm_end_hour.focus();
		return false;
	}
	
	else {
		alert("교과목이 추가 되었습니다");
		document.frm.submit();                   /* 데이터베이스로 "insert mode" 데이터 보내기 */
		return true;                             /* true 까먹지 말고 */
	}	
}

function search() {
	window.location="list.jsp";                /* frm 여러개 사용 가능 */
}

function modify() {
	alert("교과목 수정이 완료되었습니다")
	document.frm.submit();                    /*데이터베이스로 "modify mode" 데이터 보내기*/
}


function res() {
	alert("교과목 수정이 취소되었습니다");
	document.frm.reset();
}





