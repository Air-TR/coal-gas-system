<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>产品</title>
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
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">产品</strong> / <small>Product</small></div>
      </div>

      <hr>

      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-6" style="width: 345px;">
          <div class="am-btn-toolbar">
            <div class="am-btn-group am-btn-group-xs">
              <button type="button" class="am-btn am-btn-default" onclick="location.href='/coal-gas-system/product/add'"><span class="am-icon-plus"></span> 新增</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 保存</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-archive"></span> 审核</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button>
            </div>
          </div>
        </div>
        
        <div class="am-u-sm-12 am-u-md-3" style="width: 240px;">
          <div class="am-form-group">
            <select id="select1"  data-am-selected="{btnSize: 'sm'}" onchange="selectChange()">
              <option <c:if test="${param.option1 == '所有等级' }"> selected="selected" </c:if> value="所有等级">所有等级</option>
              <option <c:if test="${param.option1 == '高等' }"> selected="selected" </c:if> value="高等">高等</option>
              <option <c:if test="${param.option1 == '中等' }"> selected="selected" </c:if> value="中等">中等</option>
              <option <c:if test="${param.option1 == '低等' }"> selected="selected" </c:if> value="低等">低等</option>
            </select>
          </div>
        </div>
        
        <div class="am-u-sm-12 am-u-md-3" style="width: 240px;">
          <div class="am-form-group">
            <select id="select2"  data-am-selected="{btnSize: 'sm'}" onchange="selectChange()">
              <option <c:if test="${param.option2 == '所有状态' }"> selected="selected" </c:if> value="所有状态">所有状态</option>
              <option <c:if test="${param.option2 == '不足' }"> selected="selected" </c:if> value="不足">不足</option>
              <option <c:if test="${param.option2 == '正常' }"> selected="selected" </c:if> value="正常">正常</option>
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
                <th style="text-align: center">产品编号</th>
                <th>名称</th>
                <th>等级</th>
                <th>热量 kCal/m³</th>
                <th>存储量/m³</th>
                <th>单价/￥</th>
                <th>总价/￥</th>
                <th>管理人</th>
                <th>状态</th>
                <th>操作</th>
              </tr>
              </thead>
              <tbody>
                <c:forEach items="${product_list }" var="product">
	              <tr>
	                <td><input type="checkbox" /></td>
	                <td align="center">${product.id }</td>
	                <td>${product.name }</td>
	                <td>${product.level }</td>
	                <td>${product.heat }</td>
	                <td>${product.amount }</td>
	                <td>${product.unitPrice }</td>
	                <td>${product.totalPrice }</td>
	                <td>${product.confirmPerson }</td>
	                <td <c:if test="${product.amount < 5000 }">style="color: red;"</c:if> >
	                	<c:if test="${product.amount < 5000 && depot.totalAmount != 0 }">不足</c:if>
	                	<c:if test="${product.amount >= 5000 }">正常</c:if>
	                </td>
	                <td>
	                  <div class="am-btn-toolbar">
	                    <div class="am-btn-group am-btn-group-xs">
	                      <button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" onclick="location.href='/coal-gas-system/product/edit?id='+${product.id }"><span class="am-icon-pencil-square-o"></span> 编辑</button>
	                      <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" onclick="deleteProduct(${product.id })"><span class="am-icon-trash-o"></span> 删除</button>
	                    </div>
	                  </div>
	                </td>
	              </tr>
                </c:forEach>
                
                <tr>
	                <td></td>
	                <td align="center">总计</td>
	                <td></td>
	                <td></td>
	                <td></td>
	                <td>${sumAmount }</td>
	                <td>${averagePrice }</td>
	                <td>${sumPrice }</td>
	                <td></td>
	                <td></td>
	                <td></td>
	            </tr>
                
              </tbody>
            </table>
            <div class="am-cf">
              &nbsp;共 <fmt:formatNumber type="number" value="${fn:length(product_list) / 10 + 0.49 }" maxFractionDigits="0"/> 页 ${fn:length(product_list) } 条记录 -- 第 ${param.page } 页
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
            <p>注：存储量低于5000为不足。</p>
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
 
	function deleteProduct(id) {
		if ('A' == "${user.role}" || 'B' == "${user.role}" || 'C' == "${user.role}") {
			if (window.confirm("确定删除此产品信息？")) {
				var xhr = getXhr();
				xhr.open("get", "/coal-gas-system/product/delete?id=" + id, true);
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
