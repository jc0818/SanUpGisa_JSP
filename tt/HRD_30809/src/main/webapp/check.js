/**
 * 
 */

 function joincheck()
 {
	 if(document.mci.saleno.value == "")
	 {
		 alert("1번 입력 안됨 병신아");
		 mci.saleno.focus();
		 return false;
	 }
	 
	  if(document.mci.scode.value == "")
	 {
		 alert("2번 입력 안됨 병신아");
		 mci.scode.focus();
		 return false;
	 }
	  if(document.mci.saledate.value == "")
	 {
		 alert("3번 입력 안됨 병신아");
		 mci.saledate.focus();
		 return false;
	 }
	 	  if(document.mci.pcode.value == "")
	 {
		 alert("4번 입력 안됨 병신아");
		 mci.pcode.focus();
		 return false;
	 }
	 	  if(document.mci.amount.value == "")
	 {
		 alert("5번 입력 안됨 병신아");
		 mci.amount.focus();
		 return false;
	 }
	 
	 yes();
	 return true;
	 
 }
 
 function yes()
 {
	 alert("d등록이 완료");
	 
 }