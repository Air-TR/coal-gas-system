<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>员工</title>
  <meta name="description" content="这是一个 table 页面">
  <meta name="keywords" content="table">
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
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">员工</strong> / <small>Staff</small></div>
      </div>

      <hr>

      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-6" style="width: 345px;">
          <div class="am-btn-toolbar">
            <div class="am-btn-group am-btn-group-xs">
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-plus"></span> 新增</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 保存</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-archive"></span> 审核</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button>
            </div>
          </div>
        </div>
        
        <div class="am-u-sm-12 am-u-md-3" style="width: 240px;">
          <div class="am-form-group">
            <select id="select1" data-am-selected="{btnSize: 'sm'}" onchange="selectChange()">
              <option <c:if test="${param.option1 == '所有部门' }"> selected="selected" </c:if> value="所有部门">所有部门</option>
              <option <c:if test="${param.option1 == '管理部' }"> selected="selected" </c:if> value="管理部">管理部</option>
              <option <c:if test="${param.option1 == '财务部' }"> selected="selected" </c:if> value="财务部">财务部</option>
              <option <c:if test="${param.option1 == '人事部' }"> selected="selected" </c:if> value="人事部">人事部</option>
              <option <c:if test="${param.option1 == '原料部' }"> selected="selected" </c:if> value="原料部">原料部</option>
              <option <c:if test="${param.option1 == '加工部' }"> selected="selected" </c:if> value="加工部">加工部</option>
              <option <c:if test="${param.option1 == '产品部' }"> selected="selected" </c:if> value="产品部">产品部</option>
            </select>
          </div>
        </div>
        
        <div class="am-u-sm-12 am-u-md-3" style="width: 240px;">
          <div class="am-form-group">
            <select id="select2"  data-am-selected="{btnSize: 'sm'}" onchange="selectChange()">
              <option <c:if test="${param.option2 == '所有权限' }"> selected="selected" </c:if> value="所有权限">所有权限</option>
              <option <c:if test="${param.option2 == 'B' }"> selected="selected" </c:if> value="B">B</option>
              <option <c:if test="${param.option2 == 'C' }"> selected="selected" </c:if> value="C">C</option>
              <option <c:if test="${param.option2 == 'D' }"> selected="selected" </c:if> value="D">D</option>
              <option <c:if test="${param.option2 == 'E' }"> selected="selected" </c:if> value="E">E</option>
              <option <c:if test="${param.option2 == 'F' }"> selected="selected" </c:if> value="F">F</option>
            </select>
          </div>
        </div>
        
        <div class="am-u-sm-12 am-u-md-3">
          <div class="am-input-group am-input-group-sm">
            <input id="searchText" type="text" class="am-form-field" value="${param.searchText }">
          <span class="am-input-group-btn">
            <button id="search" class="am-btn am-btn-default" type="button" onclick="search()">搜索</button>
          </span>
          </div>
        </div>
      </div>

      <div class="am-g">
        <div class="am-u-sm-12">
          <form class="am-form">
            <table class="am-table am-table-striped am-table-hover table-main">
              <thead>
              <tr>
                <th class="table-check"><input type="checkbox" /></th>
                <th class="table-id">ID</th>
                <th>姓名</th>
                <th>年龄</th>
                <th>邮箱</th>
                <th>手机</th>
                <th>薪资</th>
                <th>职位</th>
                <th>部门</th>
                <th>权限</th>
                <th>注册日期</th>
                <th>操作</th>
              </tr>
              </thead>
              <tbody>
                <c:forEach items="${staff_list }" var="staff">
	              <tr>
	                <td><input type="checkbox" /></td>
	                <td>${staff.id }</td>
	                <td><a href="/coal-gas-system/staff/manage?id=${staff.id }">${staff.name }</a></td>
	                <td>${staff.age }</td>
	                <td>${staff.email }</td>
	                <td>${staff.phone }</td>
	                <td>${staff.salary }</td>
	                <td>${staff.position }</td>
	                <td>${staff.department }</td>
	                <td>${staff.role }</td>
	                <td><fmt:formatDate value="${staff.registerDate}" pattern="yyyy年MM月dd日"/></td>
	                <td>
	                  <div class="am-btn-toolbar">
	                    <div class="am-btn-group am-btn-group-xs">
	                      <button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" onclick="location.href='/coal-gas-system/staff/manage?id=${staff.id }'"><span class="am-icon-pencil-square-o"></span> 编辑</button>
	                      <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" onclick="deleteStaff(${staff.id })"><span class="am-icon-trash-o"></span> 删除</button>
	                    </div>
	                  </div>
	                </td>
	              </tr>
                </c:forEach>
              </tbody>
            </table>
            <div class="am-cf">
              &nbsp;共 <fmt:formatNumber type="number" value="${fn:length(staff_list) / 10 + 0.49 }" maxFractionDigits="0"/> 页 ${fn:length(staff_list) } 条记录 -- 第 ${param.page } 页
              <div class="am-fr">
                <ul class="am-pagination">
                  <li class="am-disabled"><a href="#">«</a></li>
                  <li class="am-active"><a href="#">1</a></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                  <li><a href="#">4</a></li>
                  <li><a href="#">5</a></li>
                  <li><a href="#">»</a></li>
                </ul>
              </div>
            </div>
            <hr />
            <p>注：员工管理页面仅权限为 A / B / C 的用户可以访问。</p>
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
 
function deleteStaff(id) {
	if ('A' == "${user.role}" || 'B' == "${user.role}" || 'C' == "${user.role}") {
		if (window.confirm("确定删除此员工信息？")) {
			var xhr = getXhr();
			xhr.open("get", "/coal-gas-system/staff/delete?id=" + id, true);
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					window.location.reload();
				}
			}
			xhr.send();
		}
	} else {
		alert("无删除权限");
	}
}

</script>
<script src="/coal-gas-system/js/ajax.js"></script>
<script src="/coal-gas-system/js/jquery.min.js"></script>
<script src="/coal-gas-system/js/amazeui.min.js"></script>
<script src="/coal-gas-system/js/app.js"></script>

</body>
</html>