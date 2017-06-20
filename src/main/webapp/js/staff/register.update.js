function checkRegisterSubmit() {
	checkEmailRegExp();
	checkPhoneRegExp();
	checkPassword();
	checkRepeatPassword();
	var message1 = document.getElementById("messageEmail").innerText;
	var message2 = document.getElementById("messagePhone").innerText;
	var message3 = document.getElementById("messagePassword").innerText;
	var message4 = document.getElementById("messageRepeatPassword").innerText;
	// 验证必要注册信息是否都不为空且合法
	if (message1 == "" && message2 == "" && message3 == "" && message4 == "")
		return true;
	else
		return false;
}

function checkEmailRegExp() {
	var message = document.getElementById("messageEmail");
	var email = document.getElementById("email").value;
	// 校验邮箱正则表达式
	var emailRegExp = "([a-zA-Z0-9]\\_*)+@(([a-zA-Z0-9]\\-*)+\\.){1,3}[a-zA-Z\\-]+";
	// 邮箱是否为空
	if (email != "") {
		// 不成功，邮箱格式不符规范
		if (email.match(emailRegExp)) {
			checkEmailExist(email);
		} else {
			message.innerHTML="邮箱格式不正确";
		}
	} else {
		message.innerHTML="邮箱不能为空";
	}
}

function checkEmailExist(email) {
	var xhr = getXhr();
	// 执行url请求，true为异步
	xhr.open("get", "/coal-gas-system/staff/checkEmailExist?email="+email, true);
	xhr.onreadystatechange = function() {
		// xhr.readyState == 4  是表示后台处理完成了。
		// xhr.status == 200 是表示处理的结果是OK的。
		if (xhr.readyState == 4 && xhr.status == 200) {
			// 获取url请求返回信息
			var txt = xhr.responseText;
			$("messageEmail").innerHTML = txt;
		}
	};
	// 调用send方法后才会发出请求
	xhr.send(null);
}

function checkPhoneRegExp() {
	var message = document.getElementById("messagePhone");
	var phone = document.getElementById("phone").value;
	// 校验邮箱正则表达式
	var phoneRegExp = "^\\d{11}$";
	// 手机是否为空
	if (phone != "") {
		// 不成功，邮箱格式不符规范
		if (phone.match(phoneRegExp)) {
			checkPhoneExist(phone);
		} else {
			message.innerHTML="手机号为11位数字";
		}
	} else {
		message.innerHTML="手机号不能为空";
	}
}

function checkPhoneExist(phone) {
	var xhr = getXhr();
	xhr.open("get", "/coal-gas-system/staff/checkPhoneExist?phone="+phone, true);
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var txt = xhr.responseText;
			$("messagePhone").innerHTML = txt;
		}
	};
	xhr.send(null);
}

function checkUpdateSubmit() {
	checkEmailRegExp();
	checkPhoneRegExp();
	var message1 = document.getElementById("messageEmail").innerText;
	var message2 = document.getElementById("messagePhone").innerText;
	// 验证必要注册信息是否都不为空且合法
	if (message1 == "" && message2 == "") {
		return true;
	} else {
		return false;
	}
}

function checkPassword() {
	var message = document.getElementById("messagePassword");
	var password = document.getElementById("password").value;
	// 密码是否为空
	if (password != "") {
		// 不成功，密码格式不符规范
		if (password.length >= 6 && password.length <= 16) {
			message.innerHTML="";
		} else {
			message.innerHTML="密码长度6~16位";
		}
	} else {
		message.innerHTML="密码不能为空";
	}
}

function checkRepeatPassword() {
	var message = document.getElementById("messageRepeatPassword");
	if (document.getElementById("repeatPassword").value == document.getElementById("password").value) {
		message.innerHTML="";
	} else {
		message.innerHTML="两次密码不一致";
	}
}