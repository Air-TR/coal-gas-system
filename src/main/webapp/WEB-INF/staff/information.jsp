<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>个人资料</title>
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
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">个人资料</strong> / <small>Personal Information</small></div>
      </div>

      <hr/>

      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
          <div class="am-panel am-panel-default">
            <div class="am-panel-bd">
              <div class="am-g">
                <div class="am-u-md-4">
                  <img class="am-img-circle am-img-thumbnail" src="/coal-gas-system/i/Air-TR.jpg" alt=""/>
                </div>
                <div class="am-u-md-8">
                  <p>职位：${user.position}</p>
                  <p>薪资：${user.salary}</p>
                  <p>部门：${user.department}</p>
                  <p>权限：${user.role}</p>
                </div>
              </div>
            </div>
          </div>

          <div class="am-panel am-panel-default">
            <div class="am-panel-bd">
              <div class="user-info">
                <p>出勤信息 91%</p>
                <div class="am-progress am-progress-sm">
                  <div class="am-progress-bar" style="width: 91%"></div>
                </div>
                <p class="user-info-order">应出勤日：<strong>23</strong> 实际出勤：<strong>21</strong> 请假天数：<strong>2</strong></p>
              </div>
              <div class="user-info">
                <p>加班信息</p>
                <div class="am-progress am-progress-sm">
                  <div class="am-progress-bar am-progress-bar-success" style="width: 35%"></div>
                </div>
                <p class="user-info-order">累积小时：<strong>35</strong>&nbsp;&nbsp;可调休：<strong>4</strong> 天（8小时1天）</p>
              </div>
            </div>
          </div>

        </div>

        <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
          <form action="/coal-gas-system/staff/update" method="post" class="am-form am-form-horizontal" onsubmit="return checkUpdateSubmit()" autocomplete="off">
            <div class="am-form-group">
              <label for="id" class="am-u-sm-3 am-form-label">编号/Id</label>
              <div class="am-u-sm-9">
                <input type="text" name="id" id="id" value="${user.id }" readonly="readonly">
              </div>
            </div>

            <div class="am-form-group">
              <label for="nickname" class="am-u-sm-3 am-form-label">昵称/Nickname</label>
              <div class="am-u-sm-9">
                <input type="text" name="nickname" id="nickname" value="${user.nickname }" placeholder="输入你的昵称 / Nickname">
              </div>
            </div>
          	
            <div class="am-form-group">
              <label for="name" class="am-u-sm-3 am-form-label">姓名/Name</label>
              <div class="am-u-sm-9">
                <input type="text" name="name" id="name" value="${user.name }" placeholder="姓名 / Name">
              </div>
            </div>
            
            <div class="am-form-group">
              <label for="age" class="am-u-sm-3 am-form-label">年龄/Age</label>
              <div class="am-u-sm-9">
                <input type="number" name="age" id="age" value="${user.age }" placeholder="年龄 / Age">
              </div>
            </div>

            <div class="am-form-group">
              <label for="email" class="am-u-sm-3 am-form-label">邮箱/Email</label>
              <div class="am-u-sm-9">
                <input type="email" name="email" id="email" value="${user.email }" placeholder="输入你的邮箱 / Email" onblur="checkEmailRegExp()">
                <span id="messageEmail" class="required" style="position:relative; top:10px; color:red;"></span>
              </div>
            </div>

            <div class="am-form-group">
              <label for="phone" class="am-u-sm-3 am-form-label">手机/Phone</label>
              <div class="am-u-sm-9">
                <input type="tel" name="phone" id="phone" value="${user.phone }" placeholder="输入你的手机号 / Phone" onblur="checkPhoneRegExp()">
                <span id="messagePhone" class="required" style="position:relative; top:10px; color:red;"></span>
              </div>
            </div>

            <div class="am-form-group">
              <label for="introduction" class="am-u-sm-3 am-form-label">简介/Intro</label>
              <div class="am-u-sm-9">
                <textarea class="" rows="5" name="introduction" id="introduction" placeholder="输入个人简介">${user.introduction }</textarea>
                <small>200字以内介绍你自己...</small>
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

<script src="/coal-gas-system/js/jquery.min.js"></script>
<script src="/coal-gas-system/js/amazeui.min.js"></script>
<script src="/coal-gas-system/js/app.js"></script>
<script src="/coal-gas-system/js/staff/register.update.js"></script>
<script src="/coal-gas-system/js/ajax.js"></script>

</body>
</html>
