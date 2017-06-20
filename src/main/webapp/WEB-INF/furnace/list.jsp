<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>生产监控</title>
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
<body onload="monitor()">

<!-- header -->
<c:import url="../header.jsp"></c:import>

<div class="am-cf admin-main">
  <!-- sidebar -->
  <c:import url="../sidebar.jsp"></c:import>

  <!-- content start -->
  <div class="admin-content">
    <div class="admin-content-body">
      <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">煤炉监控</strong> / <small>Furnace Monitor</small></div>
      </div>

      <hr>

      <%-- 
      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-6">
          <div class="am-btn-toolbar">
            <div class="am-btn-group am-btn-group-xs">
              <button type="button" class="am-btn am-btn-default" onclick="location.href='/coal-gas-system/depot/toAdd'"><span class="am-icon-plus"></span> 新增</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 保存</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-archive"></span> 审核</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button>
            </div>
          </div>
        </div>
        <div class="am-u-sm-12 am-u-md-3">
          <div class="am-form-group">
            <select data-am-selected="{btnSize: 'sm'}">
              <option value="option1">所有类别</option>
              <option value="option2">原煤</option>
              <option value="option3">催化剂</option>
            </select>
          </div>
        </div>
        <div class="am-u-sm-12 am-u-md-3">
          <div class="am-input-group am-input-group-sm">
            <input type="text" class="am-form-field">
          <span class="am-input-group-btn">
            <button class="am-btn am-btn-default" type="button">搜索</button>
          </span>
          </div>
        </div>
      </div>
      --%>

      <div class="am-g">
        <div class="am-u-sm-12">
          <form class="am-form">
            <table class="am-table am-table-striped am-table-hover table-main">
              <thead>
              <tr>
                <th class="table-check"><input type="checkbox" /></th>
                <th>煤炉号</th>
                <th>原煤数量/kg</th>
                <th>催化剂量/kg</th>
                <th>干馏时间/min</th>
                <th>炉顶温度/℃</th>
                <th>炉底温度/℃</th>
                <th>焦油产量/t</th>
                <th>顶部煤气产量/m³</th>
                <th>底部煤气产量/m³</th>
                <th>状态</th>
                <!-- <th>操作</th> -->
              </tr>
              </thead>
              <tbody>
                <c:forEach items="${furnace_list }" var="furnace" varStatus="status">
	              <tr>
	                <td><input type="checkbox" /></td>
	                <td style="color:#0E90D2"><a href="/coal-gas-system/furnace/history?furnaceId=${furnace.id }&page=1">${furnace.id }号炉</a></td>
	                <td id="${status.index }tdCA">${furnace.coalAmount }</td>
	                <td id="${status.index }tdGA">${furnace.gasAgent }</td>
	                <td id="${status.index }tdCT">${furnace.carbonizationTime }</td>
	                <td id="${status.index }tdTT">${furnace.topTemperature }</td>
	                <td id="${status.index }tdBT">${furnace.bottomTemperature }</td>
	                <td id="${status.index }tdTA">${furnace.tarAmount }</td>
	                <td id="${status.index }tdTC">${furnace.topCoalGas }</td>
	                <td id="${status.index }tdBC">${furnace.bottomCoalGas }</td>
	                <td id="${status.index }tdRM" style="color:green">${furnace.remark }</td>
	                <%-- <td>
	                  <div class="am-btn-toolbar">
	                    <div class="am-btn-group am-btn-group-xs">
	                      <button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" onclick="location.href='/coal-gas-system/depot/toUpdate?id='+${depot.id }"><span class="am-icon-pencil-square-o"></span> 编辑</button>
	                      <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" onclick="location.href='/coal-gas-system/depot/history?depotId='+${depot.id }"><span class="am-icon-trash-o"></span> 历史</button>
	                    </div>
	                  </div>
	                </td> --%>
	              </tr>
                </c:forEach>
              </tbody>
            </table>
            <div class="am-cf">
              &nbsp;共 <fmt:formatNumber type="number" value="${fn:length(furnace_list) / 10 + 0.49 }" maxFractionDigits="0"/> 页 ${fn:length(furnace_list) } 条记录 -- 第 ${param.page } 页
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
            <p>注：炉顶温度应控制在200~400℃，炉底温度应控制在600~800℃。</p>
          </form>
        </div>

      </div>
    </div>

    <c:import url="../footer.jsp"></c:import>

  </div>
  <!-- content end -->
</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<script src="/coal-gas-system/js/jquery-3.1.1.js"></script>
<script type="text/javascript">

	function monitor() {
		setInterval(timer, 1000);
		setInterval(quoto, 2000);
	}
	
	function timer() {
		for (i = 0; i < 9; i++) {
			var ct = document.getElementById(""+i+"tdCT").innerHTML;
			var min = parseInt(ct.split(":")[0]);
			var sec = parseInt(ct.split(":")[1]);
            if (sec < 59) {
            	sec++;
            } else {
            	sec = 0;
            	min++;
            }
            if (sec < 10) {
            	sec = "0" + sec;
            }
            
            $("#"+i+"tdCT").empty();
            
            $("#"+i+"tdCT").append("" + min + ":" + sec);

		}
	}
	
	function quoto() {
		$.ajax({
			"url":"/coal-gas-system/furnace/monitor", "type":"post", "dataType":"json",
			"success":function(data) {
				// 服务器处理正确
				/* 如果服务器返回的是json字符串,$.ajax函数
					会自动将这个json字符串转换成javascript对象 */
				for (i = 0; i < data.length; i++) {
					var ca = document.getElementById(""+i+"tdCA").innerHTML;
					var ga = document.getElementById(""+i+"tdGA").innerHTML;
					var ta = parseFloat(document.getElementById(""+i+"tdTA").innerHTML);
					var tc = parseFloat(document.getElementById(""+i+"tdTC").innerHTML);
					var bc = parseFloat(document.getElementById(""+i+"tdBC").innerHTML);
					
					$("#"+i+"tdCA").empty();
					$("#"+i+"tdGA").empty();
					$("#"+i+"tdTT").empty();
					$("#"+i+"tdBT").empty();
					$("#"+i+"tdTA").empty();
					$("#"+i+"tdTC").empty();
					$("#"+i+"tdBC").empty();
					
					if (data[i][1] < 770) {
						if (data[i][1] < 620) {
							document.getElementById(""+i+"tdBT").style.color = "#3BB4F2";
							document.getElementById(""+i+"tdRM").style.color = "#3BB4F2";
							$("#"+i+"tdRM").empty();
							$("#"+i+"tdRM").append("偏低");
							if (data[i][1] < 610) {
								document.getElementById(""+i+"tdBT").style.color = "purple";
								document.getElementById(""+i+"tdRM").style.color = "purple";
								$("#"+i+"tdRM").empty();
								$("#"+i+"tdRM").append("过低");
							}
						} else {
							document.getElementById(""+i+"tdBT").style.color = "black";
							document.getElementById(""+i+"tdRM").style.color = "green";
							$("#"+i+"tdRM").empty();
							$("#"+i+"tdRM").append("正常");
						}
					} else if (data[i][1] < 790) {
						document.getElementById(""+i+"tdBT").style.color = "#FFCC00";
						document.getElementById(""+i+"tdRM").style.color = "#FFCC00";
						$("#"+i+"tdRM").empty();
						$("#"+i+"tdRM").append("警告");
					} else {
						document.getElementById(""+i+"tdBT").style.color = "red";
						document.getElementById(""+i+"tdRM").style.color = "#FF0000";
						$("#"+i+"tdRM").empty();
						$("#"+i+"tdRM").append("危险");
					}
					
					$("#"+i+"tdCA").append((ca - 0.93).toFixed(2));
					$("#"+i+"tdGA").append((ga - 0.27).toFixed(2));
					$("#"+i+"tdTT").append(data[i][0].toFixed(2));
					$("#"+i+"tdBT").append(data[i][1].toFixed(2));
					$("#"+i+"tdTA").append((ta + 0.83).toFixed(2));
					$("#"+i+"tdTC").append((tc + 21.21).toFixed(2));
					$("#"+i+"tdBC").append((bc + 13.13).toFixed(2));
				}
			},
			"error":function(){
				// 服务器处理发生异常
				alert("出错");
			}
		});
	}
 
	function deleteStaff(id) {
	    if (window.confirm("确定删除此员工信息？")) {
	    	location.href="/coal-gas-system/staff/delete?id=" + id;
	    }
	}

</script>
<script src="/coal-gas-system/js/jquery.min.js"></script>
<script src="/coal-gas-system/js/amazeui.min.js"></script>
<script src="/coal-gas-system/js/app.js"></script>

</body>
</html>
