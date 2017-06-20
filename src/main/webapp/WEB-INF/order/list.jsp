<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>订单</title>
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
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">订单</strong> / <small>Order</small></div>
      </div>

      <hr>

      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-6" style="width: 345px;">
          <div class="am-btn-toolbar">
            <div class="am-btn-group am-btn-group-xs">
              <button type="button" class="am-btn am-btn-default" onclick="location.href='/coal-gas-system/order/add'"><span class="am-icon-plus"></span> 新增</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 保存</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-archive"></span> 审核</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button>
            </div>
          </div>
        </div>
        
        <div class="am-u-sm-12 am-u-md-3" style="width: 240px;">
          <div class="am-form-group">
            <select id="select1"  data-am-selected="{btnSize: 'sm'}" onchange="selectChange()">
              <option <c:if test="${param.option1 == '所有日期' }"> selected="selected" </c:if> value="所有日期">所有日期</option>
              <option <c:if test="${param.option1 == '今天' }"> selected="selected" </c:if> value="今天">今天</option>
              <option <c:if test="${param.option1 == '昨天' }"> selected="selected" </c:if> value="昨天">昨天</option>
              <option <c:if test="${param.option1 == '本周' }"> selected="selected" </c:if> value="本周">本周</option>
              <option <c:if test="${param.option1 == '上周' }"> selected="selected" </c:if> value="上周">上周</option>
              <option <c:if test="${param.option1 == '当月' }"> selected="selected" </c:if> value="当月">当月</option>
              <option <c:if test="${param.option1 == '上月' }"> selected="selected" </c:if> value="上月">上月</option>
              <option <c:if test="${param.option1 == '本季度' }"> selected="selected" </c:if> value="本季度">本季度</option>
              <option <c:if test="${param.option1 == '上季度' }"> selected="selected" </c:if> value="上季度">上季度</option>
              <option <c:if test="${param.option1 == '今年' }"> selected="selected" </c:if> value="今年">今年</option>
              <option <c:if test="${param.option1 == '去年' }"> selected="selected" </c:if> value="去年">去年</option>
              <option <c:if test="${param.option1 == '去年以前' }"> selected="selected" </c:if> value="去年以前">去年以前</option>
            </select>
          </div>
        </div>
        
        <div class="am-u-sm-12 am-u-md-3" style="width: 240px;">
          <div class="am-form-group">
            <select id="select2"  data-am-selected="{btnSize: 'sm'}" onchange="selectChange()">
              <option <c:if test="${param.option2 == '所有状态' }"> selected="selected" </c:if> value="所有状态">所有状态</option>
              <option <c:if test="${param.option2 == '进行中' }"> selected="selected" </c:if> value="进行中">进行中</option>
              <option <c:if test="${param.option2 == '已完成' }"> selected="selected" </c:if> value="已完成">已完成</option>
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
                <th style="text-align: center">ID</th>
                <th>产品名</th>
                <th>数量/m³</th>
                <th>单位价格/元</th>
                <th>总价/元</th>
                <th>购买方</th>
                <th>地址</th>
                <th>确认人</th>
                <th>订单日期</th>
                <th>订单状态</th>
                <!-- <th>备注</th> -->
                <th>操作</th>
              </tr>
              </thead>
              <tbody>
                <c:forEach items="${order_list }" var="order">
	              <tr>
	                <td><input type="checkbox" /></td>
	                <td align="center">${order.id }</td>
	                <td>${order.productName }</td>
	                <td>${order.amount }</td>
	                <td>${order.unitPrice }</td>
	                <td>${order.totalPrice }</td>
	                <td>${order.purchaser }</td>
	                <td><a href="/coal-gas-system/map2?address=${order.address }">${order.address }</a></td>
	                <td>${order.confirmPerson }</td>
	                <td><fmt:formatDate value="${order.date}" type="date" dateStyle="long"/></td>
	                <td>
	                	<c:if test="${order.status == 0 }">进行中</c:if>
	                	<c:if test="${order.status == 1 }">已完成</c:if>
	                </td>
	                <%-- <td>${order.remark }</td> --%>
	                <td>
	                  <div class="am-btn-toolbar">
	                    <div class="am-btn-group am-btn-group-xs">
	                      <button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" onclick="location.href='/coal-gas-system/order/edit?id=${order.id }'"><span class="am-icon-pencil-square-o"> 编辑</span></button>
	                      <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" onclick="deleteOrder(${order.id })"><span class="am-icon-trash-o"></span> 删除</button>
	                      <c:if test="${order.status == 0 }">
		                      <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" style="margin-left: 10px; color: #3BB4F2;" onclick="finishOrder(${order.id })">&nbsp;完成&nbsp;</button>
	                      </c:if>
	                    </div>
	                  </div>
	                </td>
	              </tr>
                </c:forEach>
                
                <tr>
	                <td></td>
	                <td align="center">总计</td>
	                <td></td>
	                <td>${sumAmount }</td>
	                <td>${averagePrice }</td>
	                <td>${sumPrice }</td>
	                <td></td>
	                <td></td>
	                <td></td>
	                <td></td>
	                <td></td>
	                <td></td>
	            </tr>
                
              </tbody>
            </table>
            <div class="am-cf">
              &nbsp;共 <fmt:formatNumber type="number" value="${fn:length(order_list) / 15 + 0.49 }" maxFractionDigits="0"/> 页 ${fn:length(order_list) } 条记录 -- 第 ${param.page } 页
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
            <p>注：已完成订单不可编辑。</p>
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

	var pathnamePage1 = window.location.pathname + "?page=1";
	
	function finishOrder(id) {
		if ('A' == "${user.role}" || 'B' == "${user.role}" || 'C' == "${user.role}") {
			if (window.confirm("确定完成此订单？")) {
				var xhr = getXhr();
				xhr.open("get", "/coal-gas-system/order/finish?id=" + id + "&status=1", true);
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						window.location.reload();
					}
				}
				xhr.send();
			}
		} else {
			alert("无权限操作");
		}
	}

	function selectChange() {
		var pOption1 = "&option1=" + $('#select1 option:selected').val();
		var pOption2 = "&option2=" + $('#select2 option:selected').val();
		if ("" != "${param.id }") {
			pathnamePage1 += "&id=${param.id }"
		}
		location.href = pathnamePage1 + pOption1 + pOption2;
	}
	
	function search() {
		var pOption1 = "&option1=" + $('#select1 option:selected').val();
		var pOption2 = "&option2=" + $('#select2 option:selected').val();
		var pSearchText = "&searchText=" + $('#searchText').val();
		if ("" == $('#searchText').val()) {
			location.href = pathnamePage1;
		} else {
			if ("" != "${param.option1 }") {
				if ("" != "${param.option2 }")
					location.href = pathnamePage1 + pOption1 + pOption2 + pSearchText;
				else
					location.href = pathnamePage1 + pOption1 + pSearchText;
			} else if ("" != "${param.option2 }")
				location.href = pathnamePage1 + pOption2 + pSearchText;
			else
				location.href = pathnamePage1 + pSearchText;
		}
	}
	
	document.onkeydown = function(e) {
	   	if((e.keyCode || e.which) == 13) {
	   		if("searchText" == document.activeElement.id) {
		   		document.getElementById("search").click();
	   		}
	   	}
	}

	function deleteOrder(id) {
		if ('A' == "${user.role}" || 'B' == "${user.role}" || 'C' == "${user.role}") {
			if (window.confirm("确定删除此订单信息？")) {
				var xhr = getXhr();
				xhr.open("get", "/coal-gas-system/order/delete?id=" + id, true);
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
