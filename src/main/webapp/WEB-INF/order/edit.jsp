<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>编辑订单</title>
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
        <strong class="am-text-primary am-text-lg">编辑订单</strong> /
        <small>Edit Order</small>
      </div>
    </div>

    <hr>

    <form id="form1" action="/coal-gas-system/order/update" method="post" autocomplete="off" class="am-form">
    <div class="am-tabs am-margin" data-am-tabs>
      <ul class="am-tabs-nav am-nav am-nav-tabs">
        <li class="am-active"><a href="#tab1">订单信息</a></li>
      </ul>

      <div class="am-tabs-bd">
        <div class="am-tab-panel am-fade am-in am-active" id="tab1">

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                订单号
              </div>
              <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                <input type="text" class="am-input-sm" name="id" value="${order.id }" readonly="readonly" 
                	<c:if test="${order.status == 1 }">readonly="readonly" style="color: #AAA;"</c:if> >
              </div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                产品名
              </div>
              <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                <input type="text" class="am-input-sm" name="productName" value="${order.productName }" 
                	<c:if test="${order.status == 1 }">readonly="readonly" style="color: #AAA;"</c:if> >
              </div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                数量
              </div>
              <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                <input type="number" class="am-input-sm" name="amount" value="${order.amount }" 
                	<c:if test="${order.status == 1 }">readonly="readonly" style="color: #AAA;"</c:if> >
              </div>
              	m³
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                单位价格
              </div>
              <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                <input type="number" class="am-input-sm" name="unitPrice" value="${order.unitPrice }" 
                	<c:if test="${order.status == 1 }">readonly="readonly" style="color: #AAA;"</c:if> >
              </div>
              	￥
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                总价
              </div>
              <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                <input type="number" class="am-input-sm" name="totalPrice" value="${order.totalPrice }" 
                	<c:if test="${order.status == 1 }">readonly="readonly" style="color: #AAA;"</c:if> >
              </div>
              	￥
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                购买方
              </div>
              <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                <input type="text" class="am-input-sm" name="purchaser" value="${order.purchaser }" 
                	<c:if test="${order.status == 1 }">readonly="readonly" style="color: #AAA;"</c:if> >
              </div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                地址
              </div>
              <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                <input type="text" class="am-input-sm" name="address" value="${order.address }" 
                	<c:if test="${order.status == 1 }">readonly="readonly" style="color: #AAA;"</c:if> >
              </div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                确认人
              </div>
              <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                <input type="text" class="am-input-sm" name="confirmPerson" value="${order.confirmPerson }" 
                	<c:if test="${order.status == 1 }">readonly="readonly" style="color: #AAA;"</c:if> >
              </div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                订单日期
              </div>
              <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                <input type="text" class="am-input-sm" readonly="readonly" value="<fmt:formatDate value="${order.date}" pattern="yyyy-MM-dd aa hh:mm	EEEE"/>" 
                	<c:if test="${order.status == 1 }"> style="color: #AAA;"</c:if> >
              </div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                订单状态
              </div>
              <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                <input type="text" class="am-input-sm" readonly="readonly" id="status"
                	<c:if test="${order.status == 0 }">value="进行中"</c:if> 
                	<c:if test="${order.status == 1 }">value="已完成"</c:if> 
                	<c:if test="${order.status == 1 }">readonly="readonly" style="color: #AAA;"</c:if> >
              </div>
            </div>
            
            <div class="am-g am-margin-top-sm">
              <div class="am-u-sm-12 am-u-md-2 am-text-right admin-form-text">
                备注
              </div>
              <div class="am-u-sm-12 am-u-md-10">
                <textarea rows="5" name="remark" 
                	<c:if test="${order.status == 0 }">style="width:580px;"</c:if>
                	<c:if test="${order.status == 1 }">readonly="readonly" style="width:580px; color: #AAA;"</c:if>>${order.remark }</textarea>
              </div>
            </div>
            
            <br>
        
        </div>

      </div>
    </div>
    </form>

    <div class="am-margin">
      <button type="button" class="am-btn am-btn-primary am-btn-xs" onclick="submit1()">提交修改</button>
      <button type="button" class="am-btn am-btn-primary am-btn-xs" onclick="history.back()">放弃修改</button>
    </div>
  </div>

  <c:import url="../footer.jsp"></c:import>
</div>
<!-- content end -->

</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<script type="text/javascript">

	function submit1() {
		if ('进行中' == $("#status").val()) 
			document.getElementById("form1").submit();
		else 
			alert("已完成订单不可修改");
	}
	
</script>
<script src="/coal-gas-system/js/jquery.min.js"></script>
<script src="/coal-gas-system/js/amazeui.min.js"></script>
<script src="/coal-gas-system/js/app.js"></script>

</body>
</html>
