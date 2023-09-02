function resetText() {
	
	document.frm_insert.artist_id.value="";
	document.frm_insert.artist_name.value="";
	document.frm_insert.birth_y.value="";
	document.frm_insert.birth_m.value="";
	document.frm_insert.birth_d.value="";
	document.frm_insert.artist_gender[0].checked = false;
	document.frm_insert.artist_gender[1].checked = false;
	document.frm_insert.talent.value="";
	document.frm_insert.agency.value="";

	alert("정보를 지우고 처음부터 다시 입력합니다!");
	return false;
}

function resetMsg() {
	alert("정보를 지우고 처음부터 다시 입력합니다!" );
}

// 성별 라디오버튼 선택 확인 함수 ** 복잡해서 사용하지 않음 ** 
/*
function checkRadioButton(objName) {
	var radioObj = document.getElementByld(objName);
	var isChecked = false;
	
	for(i=0; i<radioObj.length; i++) {
		if(radioObj[i].checked) {
			isChecked = true;
			//alert("성별이 체크 됨.");
			break;
		}
	}
	
	if(isChecked==false) {
		//alert("성별이 입력되지 않았습니다.");
		return false;
	}
}
*/

// inputBox 에 빈 곳이 있는지 확인하는 함수
function insertChect() {

	if(document.frm_insert.artist_id.value=="") {
		alert("참가가번호가 입력되지 않았습니다.");
		frm_insert.artist_id.focus();
		return false;
	};
	
	if(document.frm_insert.artist_name.value=="") {
		alert("참가자명이 입력되지 않았습니다.");
		frm_insert.artist_name.focus();
		return false;
	};

	if(document.frm_insert.birth_y.value=="") {
		alert("생년월일이 입력되지 않았습니다.");
		frm_insert.birth_y.focus();
		return false;
	};

	if(document.frm_insert.birth_m.value=="") {
		alert("생년월일이 입력되지 않았습니다.");
		frm_insert.birth_m.focus();
		return false;
	};

	if(document.frm_insert.birth_d.value=="") {
		alert("생년월일이 입력되지 않았습니다.");
		frm_insert.birth_d.focus();
		return false;
	};

/*
	if( checkRadioButton('artist_gender')==false) {
		alert("성별이 선택되지 않았습니다.");
		return false;
	}; 
*/

	if(    document.frm_insert.artist_gender[0].checked==false 
	    && document.frm_insert.artist_gender[1].checked==false) {
		alert("성별이 선택되지 않았습니다.");
		return false;
	};

	if(document.frm_insert.talent.value=="") {
		alert("특기가 선택되지 않았습니다.");
		frm_insert.talent.focus();
		return false;
	};

	if(document.frm_insert.agency.value=="") {
		alert("소속사가 입력되지 않았습니다.");
		frm_insert.agency.focus();
		return false;
	};

	success();
	return true;
}

function success() {
	alert("참가신청이 정상적으로 등록 되었습니다!");
}
