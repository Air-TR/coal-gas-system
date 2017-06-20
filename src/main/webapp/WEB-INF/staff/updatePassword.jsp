<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>修改密码</title>
  <meta name="description" content="这是一个 user 页面">
  <meta name="keywords" content="user">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="/coal-gas-system/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="/coal-gas-system/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="/coal-gas-system/css/amazeui.min.css"/>
  <link rel="stylesheet" href="/coal-gas-system/css/admin.css">
</head>
<body>

<!-- header -->
<c:import url="../header.jsp"></c:import>

<div class="am-cf admin-main">
  <!-- sidebar -->
  <c:import url="../sidebar.jsp"></c:import>

  <!-- content start -->
  <div class="admin-content">
    <div class="admin-content-body">
      <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">修改密码</strong> / <small>Update Password</small></div>
      </div>

      <hr/>

      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
          <%-- <div class="am-panel am-panel-default">
            <div class="am-panel-bd">
              <div class="am-g">
                <div class="am-u-md-4">
                  <img class="am-img-circle am-img-thumbnail" src="/coal-gas-system/i/Air-TR.jpg" alt=""/>
                </div>
                <div class="am-u-md-8">
                  <p>职位：${user.position}</p>
                  <p>薪资：${user.salary}</p>
                  <p>权限：${user.role}</p>
                  <form class="am-form">
                    <div class="am-form-group">
                      <input type="file" id="user-pic">
                      <p class="am-form-help">请选择要上传的文件...</p>
                      <button type="button" class="am-btn am-btn-primary am-btn-xs">保存</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div> --%>

          <!-- <div class="am-panel am-panel-default">
            <div class="am-panel-bd">
              <div class="user-info">
                <p>等级信息</p>
                <div class="am-progress am-progress-sm">
                  <div class="am-progress-bar" style="width: 60%"></div>
                </div>
                <p class="user-info-order">当前等级：<strong>LV8</strong> 活跃天数：<strong>587</strong> 距离下一级别：<strong>160</strong></p>
              </div>
              <div class="user-info">
                <p>信用信息</p>
                <div class="am-progress am-progress-sm">
                  <div class="am-progress-bar am-progress-bar-success" style="width: 90%"></div>
                </div>
                <p class="user-info-order">信用等级：正常当前 信用积分：<strong>90</strong></p>
              </div>
            </div>
          </div> -->

        </div>

        <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
          <form action="/coal-gas-system/staff/updatePassword?id=${user.id}" method="post" class="am-form am-form-horizontal" onsubmit="return checkUpdatePasswordSubmit()" autocomplete="off">
          	<br>
            <div class="am-form-group">
              <label for="oldPassword" class="am-u-sm-3 am-form-label">旧密码 :</label>
              <div class="am-u-sm-9">
                <input type="password" id="oldPassword" name="oldPassword" placeholder="输入旧密码 / Old Password" onblur="checkOldPassword()">
                <span id="message1" class="required" style="position:relative; top:10px; color:red;"></span>
              </div>
            </div>
          
            <div class="am-form-group">
              <label for="password" class="am-u-sm-3 am-form-label">新密码 :</label>
              <div class="am-u-sm-9">
                <input type="password" id="password" name="password" placeholder="输入新密码 / New Password" onblur="checkPassword()">
                <span id="message2" class="required" style="position:relative; top:10px; color:red;"></span>
              </div>
            </div>
          
            <div class="am-form-group">
              <label for="repeatPassword" class="am-u-sm-3 am-form-label">确认密码 :</label>
              <div class="am-u-sm-9">
                <input type="password" id="repeatPassword" name="repeatPassword" placeholder="确认新密码 / Repeat Password" onblur="checkRepeatPassword()">
                <span id="message3" class="required" style="position:relative; top:10px; color:red;"></span>
              </div>
            </div>

            <div class="am-form-group">
              <div class="am-u-sm-9 am-u-sm-push-3">
                <button type="submit" class="am-btn am-btn-primary">保存修改</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>

    <c:import url="../footer.jsp"></c:import>

  </div>
  <!-- content end -->

</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<script type="text/javascript">
	function checkUpdatePasswordSubmit() {
		checkOldPassword();
		checkPassword();
		checkRepeatPassword();
		var message1 = document.getElementById("message1").innerText;
		var message2 = document.getElementById("message2").innerText;
		var message3 = document.getElementById("message3").innerText;
		if (message1 == "" && message2 == "" && message3 == "") {
			return true;
		} else {
			return false;
		}
	}

	function checkOldPassword() {
		var message = document.getElementById("message1");
		var password = ${user.password};
		if (document.getElementById("oldPassword").value == password) {
			message.innerHTML="";
		} else {
			message.innerHTML="旧密码错误";
		}
	}
	
	function checkPassword() {
		var message = document.getElementById("message2");
		var password = document.getElementById("password").value;
		var oldPassword = ${user.password};
		if (password.length >= 6 && password.length <= 16) {
			if (password != oldPassword) {
				message.innerHTML="";
			} else {
				message.innerHTML="密码没有更新";
			}
		} else {
			message.innerHTML="密码长度6~16位";
		}
	}
	
	function checkRepeatPassword() {
		var message = document.getElementById("message3");
		if (document.getElementById("repeatPassword").value == document.getElementById("password").value) {
			message.innerHTML="";
		} else {
			message.innerHTML="两次密码不一致";
		}
	}
</script>
<script src="/coal-gas-system/js/jquery.min.js"></script>
<script src="/coal-gas-system/js/amazeui.min.js"></script>
<script src="/coal-gas-system/js/app.js"></script>

</body>
</html>
