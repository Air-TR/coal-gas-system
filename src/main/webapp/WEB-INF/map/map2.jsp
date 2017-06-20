<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		#r-result {width:24%; height:520px; margin-left: 2%; float: left; display: inline; border: 1px #ABC0DD solid; overflow-y:auto;}
		#allmap {width:72%; height:520px; margin-right: 2%; float: left; display: inline; border: 1px #ABC0DD solid;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=DD279b2a90afdf0ae7a3796787a0742e"></script>
	<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
	<title>地图</title>
	<link rel="icon" type="image/png" href="/coal-gas-system/i/favicon.png">
	<link rel="apple-touch-icon-precomposed" href="/coal-gas-system/i/app-icon72x72@2x.png">
	<link rel="stylesheet" href="/coal-gas-system/css/amazeui.min.css" />
	<link rel="stylesheet" href="/coal-gas-system/css/admin.css">
</head>
<body onload="$('#result').click()">

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
						<strong class="am-text-primary am-text-lg">地图导航</strong>
						/ <small>Map Navigator</small>
					</div>
					
					<div class="am-u-sm-12 am-u-md-3" style="margin-left: 150px; width: 240px; height: 20px;">
         					<div class="am-form-group">
         						<select id="select" data-am-selected="{btnSize: 'sm'}" onchange="change()">
				              	<option value="0">最少时间</option>
								<option value="1">最短距离</option>
								<option value="2">避开高速</option>
				            </select>
						</div>
					</div>
					
			        <div class="am-u-sm-12 am-u-md-3" style="padding: 0;">
			          	<div class="am-input-group am-input-group-sm" style="width: 506px; height: 20px; float: right;">
				            <input id="start" placeholder="输入起点" value="${address }" type="text" class="am-form-field" style="width: 200px; margin-right: 24px;">
				            <input id="end" placeholder="输入终点" value="${param.address }" type="text" class="am-form-field" style="width: 200px; margin-right: 24px;">
				          	<span class="am-input-group-btn" style="height: 20px;">
				            	<input type="button" id="result" class="am-btn am-btn-default" value="查询"/>
	         				</span>
			          		<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
			          	</div>
			        </div>
					
				</div>
				
				<hr>
				
				<div>
					<div id="r-result"></div>
					<div id="allmap"></div>
				</div>
				
			</div>

			<c:import url="../footer.jsp"></c:import>
		</div>
		<!-- content end -->

	</div>

	<a href="#"
		class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
		data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

</body>
</html>

<script type="text/javascript">
	//百度地图API功能
	var map = new BMap.Map("allmap");
	map.centerAndZoom("苏州", 12);
	map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
	map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用
	map.enableInertialDragging();
	/* map.addControl(new BMap.ScaleControl()); */                    // 添加比例尺控件
	map.addControl(new BMap.OverviewMapControl());              //添加缩略地图控件
	map.addControl(new BMap.MapTypeControl());          //添加地图类型控件
	map.disable3DBuilding();
	
	// 城市列表切换控件
	var size = new BMap.Size(10, 20);
	map.addControl(new BMap.CityListControl({
	    anchor: BMAP_ANCHOR_TOP_LEFT,
	    offset: size,
	}));
	
	// 三种驾车策略：最少时间，最短距离，避开高速
	var routePolicy = [BMAP_DRIVING_POLICY_LEAST_TIME,BMAP_DRIVING_POLICY_LEAST_DISTANCE,BMAP_DRIVING_POLICY_AVOID_HIGHWAYS];
	
	$("#result").click(function() {
		if ('' == $("#start").val() || '' == $("#end").val()) return;
		document.getElementById('r-result').style.display = 'inline';
		document.getElementById('allmap').style.width = '72%';
		document.getElementById('allmap').style.marginLeft = 0;
		var start = $("#start").val();
		var end = $("#end").val();
		map.clearOverlays(); 
		var i=$("#select").val();
		search(start,end,routePolicy[i]); 
		function search(start,end,route){ 
			var driving = new BMap.DrivingRoute(map, {renderOptions:{map: map, panel: "r-result", autoViewport: true},policy: route});
			driving.search(start,end);
		}
	});
	
	function change() {
		$("#result").click();
	}
	
	document.onkeydown = function(e) {
	   	if((e.keyCode || e.which) == 13) {
		   	$("#result").click();
	   	}
	}
</script>
<script src="/coal-gas-system/js/jquery.min.js"></script>
<script src="/coal-gas-system/js/amazeui.min.js"></script>
<script src="/coal-gas-system/js/app.js"></script>
