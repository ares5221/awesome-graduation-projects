/*检查登录信息*/
function checklogin() {
	var ssn = loginform.user.value.toLowerCase();

	if (!checkUserName(ssn))
		return false; // 用户名检查

	if (strlen(loginform.password.value) < 6 || strlen(loginform.password.value) > 16) {
		alert("\正确地登录密码长度为6-16位，仅可用英文、数字、特殊字符！");
		loginform.password.focus();
		return false;
	}

	if (strlen2(loginform.password.value)) {
		alert("\您的密码中包含了非法字符，仅可用英文、数字、特殊字符！");
		loginform.password.focus();
		return false;
	}
	
	if (loginform.password.value == loginform.user.value) {
		alert("\用户名和密码不能相同！");
		loginform.password.focus();
		return false;
	}
	
	if (loginform.password2.value == "") {
		alert("\请输入密码确认！");
		loginform.password2.focus();
		return false;
	}
	
	if (loginform.password2.value != loginform.password.value) {
		alert("\两次密码输入不一致！");
		loginform.password.focus();
		return false;
	}

	if (loginform.question.value == "") {
		alert("\请输入提示问题,当您忘记密码时可根据该问题提示密码！");
		loginform.question.focus();
		return false;
	}
	
	if (strlen(loginform.answer.value) < 6) {
		alert("\请重新输入问题答案，长度不少于6位！");
		loginform.answer.focus();
		return false;
	}
	
	if (loginform.question.value == loginform.answer.value) {
		alert("\密码提示问题和答案不能相同！");
		loginform.answer.focus();
		return false;
	}
	
	if (strlen(loginform.pingma.value) < 6 || strlen(loginform.pingma.value) > 16) {
		alert("\正确的安全码长度为6-16位，仅可用英文、数字、特殊字符！");
		loginform.pingma.focus();
		return false;
	}
	
	if (strlen2(loginform.pingma.value)) {
		alert("\您的安全码中包含了非法字符，仅可用英文、数字、特殊字符！");
		loginform.pingma.focus();
		return false;
	}
	
	if (loginform.pingma.value == loginform.user.value) {
		alert("\用户名和安全码不能相同！");
		loginform.pingma.focus();
		return false;
	}
	
	if (loginform.pingma2.value == "") {
		alert("\请输入安全码确认！");
		loginform.pingma2.focus();
		return false;
	}
	
	if (loginform.pingma.value != loginform.pingma2.value) {
		alert("\两次安全码输入不一致！");
		loginform.pingma.focus();
		return false;
	}

	return true;
}

function checkUserName(ssn) {
	if (ssn.length < 3 || ssn.length > 18) {
		alert("\请输入正确的用户名,用户名长度为3-18位！");
		loginform.user.focus();
		return false;
	}
	
	if (isWhiteWpace(ssn)) {
		alert("\请输入正确的用户名,用户名中不能包含空格！");
		loginform.user.focus();
		return false;
	}
	
	if (!isSsnString(ssn)) {
		alert("\    对不起，您选择的用户名不正确或已被占用！用户名\n由a～z的英文字母(不区分大小写)、0～9的数字、点、减\n号或下划线组成，长度为3～18个字符，只能以数字或字母\n开头和结尾,例如:kyzy_001。");
		loginform.user.focus();
		return false;
	}
	
	return true;
}

function strlen(str) {
	var len;
	var i;
	len = 0;
	for (i = 0; i < str.length; i++) {
		if (str.charCodeAt(i) > 255)
			len += 2;
		else
			len++;
	}
	
	return len;
}

function strlen2(str) {
	//var len;
	var i;
	len = 0;
	for (i = 0; i < str.length; i++) {
		if (str.charCodeAt(i) > 255)
			return true;
	}
	
	return false;
}

function isWhiteWpace(s) {
	var whitespace = " \t\n\r";
	var i;
	for (i = 0; i < s.length; i++) {
		var c = s.charAt(i);
		if (whitespace.indexOf(c) >= 0) {
			return true;
		}
	}
	
	return false;
}

function isSsnString(ssn) {
	var re = /^[0-9a-z][\w-.]*[0-9a-z]$/i;
	if (re.test(ssn))
		return true;
	else
		return false;
}

function checkssn(gotoURL) {
	var ssn = loginform.user.value.toLowerCase();
	if (checkUserName(ssn)) {
		var open_url = gotoURL + "?user=" + ssn;
		window.open(open_url,'','status=0,directories=0,resizable=0,toolbar=0,location=0,scrollbars=0,width=322,height=200');
	}
}

//检查输入框是否为空
function checkinform() {	
	 var input  = /^[\s]*$/;  
	 if (input.test(tset)){  
	     alert("输入不能为空"); 
	      return false;  
	 } 
}


