<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Form</title>
  <meta name="description" content="这是一个form页面">
  <meta name="keywords" content="form">
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
      <div class="am-fl am-cf">
        <strong class="am-text-primary am-text-lg">高级修改</strong> /
        <small>Senior Update</small>
      </div>
    </div>

    <hr>

    <form id="form1" action="/coal-gas-system/staff/seniorUpdate?id=${staff.id }&confirmPerson=${user.name}" method="post" autocomplete="off" class="am-form">
    <div class="am-tabs am-margin" data-am-tabs>
      <ul class="am-tabs-nav am-nav am-nav-tabs">
        <li class="am-active"><a href="#tab1">基本信息</a></li>
        <li><a href="#tab2">职位信息</a></li>
        <li><a href="#tab3">权限设置</a></li>
      </ul>

      <div class="am-tabs-bd">
        <div class="am-tab-panel am-fade am-in am-active" id="tab1">
            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                姓名
              </div>
              <div class="am-u-sm-8 am-u-md-4">
                <input type="text" class="am-input-sm" name="name" value="${staff.name }">
              </div>
              <div class="am-hide-sm-only am-u-md-6"></div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                年龄
              </div>
              <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                <input type="number" class="am-input-sm" name="age" value="${staff.age }">
              </div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                邮箱
              </div>
              <div class="am-u-sm-8 am-u-md-4">
                <input type="text" class="am-input-sm" name="email" value="${staff.email }">
              </div>
              <div class="am-hide-sm-only am-u-md-6"></div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                手机
              </div>
              <div class="am-u-sm-8 am-u-md-4">
                <input type="text" class="am-input-sm" name="phone" value="${staff.phone }">
              </div>
              <div class="am-u-sm-12 am-u-md-6"></div>
            </div>

            <div class="am-g am-margin-top-sm">
              <div class="am-u-sm-12 am-u-md-2 am-text-right admin-form-text">
                简介
              </div>
              <div class="am-u-sm-12 am-u-md-10">
                <textarea rows="5" name="introduction" style="width:580px;">${staff.introduction }</textarea>
              </div>
            </div>
        </div>

        <div class="am-tab-panel am-fade" id="tab2">
            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                职位
              </div>
              <div class="am-u-sm-8 am-u-md-4">
                <input type="text" class="am-input-sm" name="position" value="${staff.position }">
              </div>
              <div class="am-hide-sm-only am-u-md-6"></div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                薪资
              </div>
              <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                <input type="text" class="am-input-sm" name="salary" value="${staff.salary }">
              </div>
            </div>
            
            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                部门
              </div>
              <div class="am-u-sm-8 am-u-md-4">
                <input type="text" class="am-input-sm" name="department" value="${staff.department }">
              </div>
              <div class="am-hide-sm-only am-u-md-6"></div>
            </div>
            <br>
        </div>

        <div class="am-tab-panel am-fade" id="tab3">
            <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-2 am-text-right">权限</div>
	            <div class="am-u-sm-8 am-u-md-10">
	              <select data-am-selected name="role">
	              	<c:if test="${staff.role == 'A' }">
	                  	<option ${staff.role == "A" ? "selected" : "" } value="A">A</option>
	              	</c:if>
	              	<c:if test="${user.role == 'A' && staff.role != 'A' }">
	              		<option ${staff.role == "A" ? "selected" : "" } value="A">A</option>
	              	</c:if>
	              	<c:if test="${staff.role != 'A' }">
		                <option ${staff.role == "B" ? "selected" : "" } value="B">B</option>
		                <option ${staff.role == "C" ? "selected" : "" } value="C">C</option>
		                <option ${staff.role == "D" ? "selected" : "" } value="D">D</option>
		                <option ${staff.role == "E" ? "selected" : "" } value="E">E</option>
		                <option ${staff.role == "F" ? "selected" : "" } value="F">F</option>
	                </c:if>
	              </select>
	            </div>
            </div>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
        </div>
        
      </div>
    </div>
    </form>

    <div class="am-margin">
      <button type="button" class="am-btn am-btn-primary am-btn-xs" onclick="submit1()">提交修改</button>
      <button type="button" class="am-btn am-btn-primary am-btn-xs" onclick="history.back()">放弃修改</button>
      &emsp;<span class="required" style="position:relative; top:3px; color:red; font-size:15px;">${Error_UpdateStaff}</span>
    </div>
  </div>

  <c:import url="../footer.jsp"></c:import>
</div>
<!-- content end -->

</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<script type="text/javascript">

	function submit1() {
		document.getElementById("form1").submit();
	}
	
</script>
<script src="/coal-gas-system/js/jquery.min.js"></script>
<script src="/coal-gas-system/js/amazeui.min.js"></script>
<script src="/coal-gas-system/js/app.js"></script>

</body>
</html>
