function checkNullOrExistId() {
	var message = $("message_depotId");
	var id = $V("depotId");
	if ("" != id) {
		var xhr = getXhr();
		xhr.open("get", "/coal-gas-system/depot/checkIdExist?id="+id, true);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var txt = xhr.responseText;
				message.innerHTML = txt;
			}
		}
		xhr.send();
	} else
		message.innerHTML="* 仓库号不能为空";
}

function checkUnExistDepotId() {
	var message = $("message_depotId");
	var id = $V("depotId");
	if ("" != id) {
		var xhr = getXhr();
		xhr.open("get", "/coal-gas-system/depot/checkIdUnExist?id="+id, true);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var txt = xhr.responseText;
				message.innerHTML = txt;
			}
		}
		xhr.send();
	} else
		message.innerHTML = "";
}