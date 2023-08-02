function add() {
	if(document.frm.stuid.value.length==0) {
		alert("학번이 입력되지 않았습니다");
		frm.stuid.focus();
		return false;
	}
	
	else if(document.frm.midscore.value.length==0) {
		alert("중간고사는 숫자가 아니거나 입력하지 않았습니다!");
		frm.midscore.focus();
		return false;
	}
	
	else if(document.frm.finalscore.value.length==0) {
		alert("기말고사는 숫자가 아니거나 입력하지 않았습니다!");
		frm.finalscore.focus();
		return false;
	}
	
	else if(document.frm.attend.value.length==0) {
		alert("출석은 숫자가 아니거나 입력하지 않았습니다!");
		frm.attend.focus();
		return false;
	}
	
	else if(document.frm.report.value.length==0) {
		alert("레포트는 숫자가 아니거나 입력하지 않았습니다!");
		frm.report.focus();
		return false;
	}
	
	else if(document.frm.etc.value.length==0) {
		alert("기타는 숫자가 아니거나 입력하지 않았습니다!");
		frm.etc.focus();
		return false;
	}
	
	else {
		alert("성적정보가 정상적으로 등록되었습니다!");
		document.frm.submit(); //데이터베이스로 데이터 보내기
		return true;
	}
}

function res() {
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	document.frm.reset();
}


function search() {
	document.frm2.submit(); //데이터베이스로 데이터 보내기
	
}






