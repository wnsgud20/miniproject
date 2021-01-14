function checkWrite(){
	document.getElementById("nameDiv").innerText = "";
	document.getElementById("idDiv").innerText = "";
	
	if(document.getElementById("name").value=="")
		document.getElementById("nameDiv").innerText = "이름을 입력하세요";
		
	else if(document.getElementById("id").value=="")
		document.getElementById("idDiv").innerText = "아이디를 입력하세요";
	
	else if(document.writeForm.pwd.value=="") 
		alert("비밀번호를 입력하세요");
		
	else if(document.writeForm.pwd.value != document.writeForm.repwd.value) 
		alert("비밀번호가 맞지 않습니다");
		
	else if(document.writeForm.id.value != document.writeForm.check.value)
		alert("중복체크 하세요");
		
	else 
		document.writeForm.submit();
}

function checkId(){
	let id = document.getElementById("id").value;
	
	if(id=="")
		document.getElementById("idDiv").innerText = "먼저 아이디를 입력하세요";
	else
	    window.open("checkId.do?id="+id, "checkId", "width=450 height=150");
}

function checkPost(){
	window.open("checkPost.do", "", "width=700 height=500 scrollbars=yes");
}

function checkModify(){
	document.getElementById("nameDiv").innerText = "";
		
	if(document.getElementById("name").value=="")
		document.getElementById("nameDiv").innerText = "이름을 입력하세요";
		
	else if(document.modifyForm.pwd.value=="") 
		alert("비밀번호를 입력하세요");
		
	else if(document.modifyForm.pwd.value != document.modifyForm.repwd.value) 
		alert("비밀번호가 맞지 않습니다");
		
	else 
		document.modifyForm.submit();
}















