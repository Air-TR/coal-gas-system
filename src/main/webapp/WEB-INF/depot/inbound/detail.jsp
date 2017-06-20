<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.Date,java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>入库详情</title>
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
<c:import url="../../header.jsp"></c:import>

<div class="am-cf admin-main">
  <!-- sidebar -->
  <c:import url="../../sidebar.jsp"></c:import>

<!-- content start -->
<div class="admin-content">
  <div class="admin-content-body">
    <div class="am-cf am-padding am-padding-bottom-0">
      <div class="am-fl am-cf">
        <strong class="am-text-primary am-text-lg">入库详情</strong> /
        <small>InBound Detail</small>
      </div>
    </div>

    <hr>

    <form id="form" action="/coal-gas-system/inbound/insert" method="get" autocomplete="off" class="am-form">
    <div class="am-tabs am-margin" data-am-tabs>
      <ul class="am-tabs-nav am-nav am-nav-tabs">
        <li class="am-active"><a href="#tab1">详细信息</a></li>
      </ul>

      <div class="am-tabs-bd">
        <div class="am-tab-panel am-fade am-in am-active" id="tab1">
            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                仓库号
              </div>
              <div class="am-u-sm-8 am-u-md-4">
                <input type="number" class="am-input-sm" name="depotId" placeholder="${inbound.id }" readonly="readonly">
                <span id="messageId" class="required" style="position:relative; color:red; font-size: 15px;"></span>
              </div>
              <div class="am-hide-sm-only am-u-md-6"></div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                运煤车号
              </div>
              <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                <input type="number" class="am-input-sm" name="truckId" placeholder="${inbound.truckId }" readonly="readonly">
              </div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                数量
              </div>
              <div class="am-u-sm-8 am-u-md-4">
                <input type="number" class="am-input-sm" name="amount" placeholder="${inbound.amount }" readonly="readonly">
              </div>t
              <div class="am-hide-sm-only am-u-md-6"></div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                单价
              </div>
              <div class="am-u-sm-8 am-u-md-4">
                <input type="number" class="am-input-sm" name="unitPrice" placeholder="${inbound.unitPrice }" readonly="readonly">
              </div>￥/ t
              <div class="am-u-sm-12 am-u-md-6"></div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                总价
              </div>
              <div class="am-u-sm-8 am-u-md-4">
                <input type="number" class="am-input-sm" name="totalPrice" placeholder="${inbound.totalPrice }" readonly="readonly">
              </div>￥
              <div class="am-u-sm-12 am-u-md-6"></div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                确认人
              </div>
              <div class="am-u-sm-8 am-u-md-4">
                <input type="text" class="am-input-sm" name="comfirmPerson" placeholder="${inbound.comfirmPerson }" readonly="readonly">
              </div>
              <div class="am-u-sm-12 am-u-md-6"></div>
            </div>

            <div class="am-g am-margin-top">
              <div class="am-u-sm-4 am-u-md-2 am-text-right">
                入库日期
              </div>
              <div class="am-u-sm-8 am-u-md-4">
                <input type="text" class="am-input-sm" name="inBoundDate" placeholder="<fmt:formatDate value="${inbound.inBoundDate}" pattern="yyyy-MM-dd aa hh:mm	EEEE"/>" readonly="readonly">
              </div>
              <div class="am-u-sm-12 am-u-md-6"></div>
            </div>

            <div class="am-g am-margin-top-sm">
              <div class="am-u-sm-12 am-u-md-2 am-text-right admin-form-text">
                备注
              </div>
              <div class="am-u-sm-12 am-u-md-10">
                <textarea rows="5" name="remark" style="width:580px;" readonly="readonly" placeholder="${inbound.remark }"></textarea>
              </div>
            </div>

        </div>

      </div>
    </div>
    </form>

    <div class="am-margin">
      <button type="button" class="am-btn am-btn-primary am-btn-xs" onclick="history.back()">返回</button>
    </div>
  </div>
  
  <c:import url="../../footer.jsp"></c:import>
</div>
<!-- content end -->

</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<script src="/coal-gas-system/js/jquery.min.js"></script>
<script src="/coal-gas-system/js/amazeui.min.js"></script>
<script src="/coal-gas-system/js/app.js"></script>

</body>
</html>
