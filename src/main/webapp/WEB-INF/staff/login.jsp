<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title>Login</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="format-detection" content="telephone=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="alternate icon" type="image/png" href="/coal-gas-system/i/favicon.png">
  <link rel="stylesheet" href="/coal-gas-system/css/amazeui.min.css"/>
  <style>
    .header {
      text-align: center;
    }
    .header h1 {
      font-size: 200%;
      color: #333;
      margin-top: 30px;
    }
    .header p {
      font-size: 14px;
    }
  </style>
</head>
<body>
<div class="header">
  <div class="am-g">
    <!-- <h1>干馏煤气管理系统</h1> -->
    <br>
    <h1>Air-TR</h1>
  </div>
  <hr/>
</div>
<div class="am-g">
  <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
    <h2 text-align:center>Login:</h2>

    <form method="post" class="am-form" autocomplete="off">
      <label for="email">邮箱 Email / 手机 Phone :</label>
      <input type="text" id="email" name="email"/>
      <br>
      <label for="password">密码 / Password :</label>
      <input type="password" id="password" name="password"/>
      <br>
      <div class="am-cf">
        <input id="button1" type="button" value="登 录" onclick="login()" class="am-btn am-btn-primary am-btn-sm am-fl"/>
	    &emsp;<span id="messageLogin" class="required" style="position:relative; top:3px; color:red; font-size:15px;"></span>
        <input type="button" value="注 册 ?" class="am-btn am-btn-default am-btn-sm am-fr" onclick="location.href='/coal-gas-system/staff/register'"/>
      </div>
    </form>
    
    <hr>
    <p>© 苏州科技大学 陶润 2017.6</p>
  </div>
</div>

<script type="text/javascript">

	function login() {
		var email = $V("email");
		var password = $V("password");
		var xhr = getXhr();
		xhr.open("get", "/coal-gas-system/staff/login?email=" + email + "&password=" + password, true);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var txt = xhr.responseText;
				if (txt == '') {
					window.location.href = "/coal-gas-system/depot/list?page=1";
				} else {
					$("messageLogin").innerHTML = txt;
					$("password").value = '';
				}
			}
		}
		xhr.send();
	}

	document.onkeydown = function(e) {
	   	if((e.keyCode || e.which) == 13) {
	   		document.getElementById("button1").click();
	   	}
	}

</script>
<script src="/coal-gas-system/js/ajax.js"></script>

</body>
</html>
