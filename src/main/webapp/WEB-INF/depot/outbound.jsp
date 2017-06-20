<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>出库</title>
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
        <strong class="am-text-primary am-text-lg">出库</strong> /
        <small>Out Bound</small>
      </div>
    </div>

    <hr>

    <form id="form" action="/coal-gas-system/depot/inbound/insert" method="post" autocomplete="off" class="am-form">
    <div class="am-tabs am-margin" data-am-tabs>
      <ul class="am-tabs-nav am-nav am-nav-tabs">
        <li class="am-active"><a href="#tab1">出库信息</a></li>
      </ul>

      <div class="am-tabs-bd">
        <div class="am-tab-panel am-fade am-in am-active" id="tab1">
            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                仓库号
              </div>
              <div class="am-u-sm-8 am-u-md-4">
                <input type="number" class="am-input-sm" id="depotId" name="depotId" onblur="checkNullOrExistId()"
                	<c:if test="${null != param.id }"> readonly="readonly" </c:if> value="${param.id }">
                <span id="messageId" class="required" style="position:relative; color:red; font-size: 15px;"></span>
              </div>
              <div class="am-hide-sm-only am-u-md-6"></div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                煤炉号
              </div>
              <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                <input type="number" class="am-input-sm" name="furnaceId">
              </div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                数量
              </div>
              <div class="am-u-sm-8 am-u-md-4">
                <input type="number" class="am-input-sm" id="amount" name="amount" onblur="calculateTotalPrice()">
              </div>t
              <div class="am-hide-sm-only am-u-md-6"></div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                单价
              </div>
              <div class="am-u-sm-8 am-u-md-4">
                <input type="number" class="am-input-sm" id="unitPrice" name="unitPrice" value="${param.unitPrice }" onblur="calculateTotalPrice()">
              </div>￥/ t
              <div class="am-u-sm-12 am-u-md-6"></div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                总价
              </div>
              <div class="am-u-sm-8 am-u-md-4">
                <input type="number" class="am-input-sm" id="totalPrice" name="totalPrice" readonly="readonly">
              </div>￥
              <div class="am-u-sm-12 am-u-md-6"></div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                确认人
              </div>
              <div class="am-u-sm-8 am-u-md-4">
                <input type="text" class="am-input-sm" name="phone" value="${user.name }">
              </div>
              <div class="am-u-sm-12 am-u-md-6"></div>
            </div>
            
              <div class="am-g am-margin-top">
	            <div class="am-u-sm-4 am-u-md-2 am-text-right">
	              出库日期
	            </div>
	            <div class="am-u-sm-8 am-u-md-10">
	              <div action="" class="am-form am-form-inline">
	                <div class="am-form-group am-form-icon">
	                  <i class="am-icon-calendar"></i>
	                  <input style="width: 331px;" type="date" class="am-form-field am-input-sm" placeholder="日期">
	                </div>
	              </div>
	            </div>
	          </div>

              <div class="am-g am-margin-top" style="margin-bottom: 20px;">
	            <div class="am-u-sm-4 am-u-md-2 am-text-right">
	              出库时间
	            </div>
	            <div class="am-u-sm-8 am-u-md-10">
	              <div class="am-form am-form-inline">
	                <div class="am-form-group am-form-icon">
	                  <i class="am-icon-calendar"></i>
	                  <input style="width: 331px;" type="datetime-local" class="am-form-field am-input-sm" placeholder="时间">
	                </div>
	              </div>
	            </div>
	          </div>

            <div class="am-g am-margin-top-sm">
              <div class="am-u-sm-12 am-u-md-2 am-text-right admin-form-text">
                备注
              </div>
              <div class="am-u-sm-12 am-u-md-10">
                <textarea rows="5" name="remark" style="width:580px;"></textarea>
              </div>
            </div>

        </div>

      </div>
    </div>
    </form>

    <div class="am-margin">
      <button type="button" class="am-btn am-btn-primary am-btn-xs" onclick="submit()">提交出库</button>
      <button type="button" class="am-btn am-btn-primary am-btn-xs" onclick="history.back()">放弃出库</button>
      &emsp;<span class="required" style="position:relative; top:3px; color:red; font-size:15px;">${Error_UpdateStaff}</span>
    </div>
  </div>

  <c:import url="../footer.jsp"></c:import>
</div>
<!-- content end -->

</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<script type="text/javascript">

	function calculateTotalPrice() {
		var amount = document.getElementById("amount").value;
		var unitPrice = document.getElementById("unitPrice").value;
		if ("" != amount && "" != unitPrice) {
			document.getElementById("totalPrice").value = amount * unitPrice;
		}
	}

	function checkInBoundSubmit() {
		checkNullOrExistId();
		var messageId = document.getElementById("messageId").innerText;
		if ("" == messageId) {
			return true;
		} else {
			return false;
		}
	}

	function submit() {
		var isSubmit = checkInBoundSubmit();
		if (isSubmit) {
			document.getElementById("form").submit();
		}
	}
	
</script>
<script src="/coal-gas-system/js/jquery.min.js"></script>
<script src="/coal-gas-system/js/amazeui.min.js"></script>
<script src="/coal-gas-system/js/app.js"></script>
<script src="/coal-gas-system/js/ajax.js"></script>
<script src="/coal-gas-system/js/depot/depot.js"></script>

</body>
</html>
