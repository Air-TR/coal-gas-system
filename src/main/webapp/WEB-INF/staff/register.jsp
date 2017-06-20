<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title>Register</title>
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
    <h1>Air-TR</h1>
  </div>
  <hr />
</div>
<div class="am-g">
  <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
    <h2 text-align:center>Register:</h2>

    <form action="/coal-gas-system/staff/insert" method="post" class="am-form" onsubmit="return checkRegisterSubmit()" autocomplete="off">
      <label for="email" style="float:left;">邮箱 / Email :</label>
      <span id="messageEmail" class="required" style="position:relative; padding-left:10px; color:red; float:left;"></span>
      <input type="text" name="email" id="email" placeholder="输入你的邮箱" onblur="checkEmailRegExp()"/>
      <br>
      <label for="phone" style="float:left;">手机 / Phone :</label>
      <span id="messagePhone" class="required" style="position:relative; padding-left:10px; color:red; float:left;"></span>
      <input type="text" name="phone" id="phone" placeholder="输入你的手机" onblur="checkPhoneRegExp()"/>
      <br>
      <label for="password" style="float:left;">密码 / Password :</label>
      <span id="messagePassword" class="required" style="position:relative; padding-left:10px; color:red; float:left;"></span>
      <input type="password" name="password" id="password" placeholder="输入你的密码" onblur="checkPassword()"/>
      <br>
      <label for="repeatPassword" style="float:left;">确认密码 / Repeat Password :</label>
      <span id="messageRepeatPassword" class="required" style="position:relative; padding-left:10px; color:red; float:left;"></span>
      <input type="password" name="repeatPassword" id="repeatPassword" placeholder="确认你的密码" onblur="checkRepeatPassword()"/>
      <br>
      <div class="am-cf">
        <input type="submit" value="注 册" class="am-btn am-btn-primary am-btn-sm am-fl"/>
	    &emsp;<span class="required" style="position:relative; top:3px; color:red; font-size:15px;">${Error_Register}</span>
        <input type="button" value="Back <" class="am-btn am-btn-default am-btn-sm am-fr" onclick="location.href='/coal-gas-system/'"/>
      </div>
    </form>
    
    <hr>
    <p>© 苏州科技大学 陶润 2017.6</p>
  </div>
</div>

<script src="/coal-gas-system/js/staff/register.update.js"></script>
<script src="/coal-gas-system/js/ajax.js"></script>

</body>
</html>
