<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="java.util.Date,java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>监控历史</title>
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
<%
	SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd");
	String today = sdfDate.format(new Date());
%>
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
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">监控历史</strong> / <small>Monitor History</small></div>
      </div>

      <hr>

      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-6" style="width: 345px;">
          <div class="am-btn-toolbar">
            <div class="am-btn-group am-btn-group-xs">
              <button type="button" class="am-btn am-btn-default" onclick="location.href='/coal-gas-system/form'"><span class="am-icon-plus"></span> 新增</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 保存</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-archive"></span> 审核</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button>
            </div>
          </div>
        </div>
        
        <div class="am-u-sm-12 am-u-md-3" style="width: 240px;">
          <div class="am-form-group">
            <select id="select1"  data-am-selected="{btnSize: 'sm'}" onchange="selectChange1()">
              <option <c:if test="${param.option1 == '所有日期' }"> selected="selected" </c:if> value="所有日期">所有日期</option>
              <option <c:if test="${param.option1 == '今天' }"> selected="selected" </c:if> value="今天">今天</option>
              <option <c:if test="${param.option1 == '昨天' }"> selected="selected" </c:if> value="昨天">昨天</option>
              <option <c:if test="${param.option1 == '本周' }"> selected="selected" </c:if> value="本周">本周</option>
              <option <c:if test="${param.option1 == '当月' }"> selected="selected" </c:if> value="当月">当月</option>
              <option <c:if test="${param.option1 == '今年' }"> selected="selected" </c:if> value="今年">今年</option>
              <option <c:if test="${param.option1 == '今年以前' }"> selected="selected" </c:if> value="今年以前">今年以前</option>
            </select>
          </div>
        </div>
        
        <div class="am-u-sm-12 am-u-md-3" style="width: 240px;">
          <div class="am-form-group">
            <select id="select2"  data-am-selected="{btnSize: 'sm'}" onchange="selectChange2()">
              <option <c:if test="${param.option2 == '所有状态' }"> selected="selected" </c:if> value="所有状态">所有状态</option>
              <option <c:if test="${param.option2 == '偏低' }"> selected="selected" </c:if> value="偏低">偏低</option>
              <option <c:if test="${param.option2 == '过低' }"> selected="selected" </c:if> value="过低">过低</option>
              <option <c:if test="${param.option2 == '危险' }"> selected="selected" </c:if> value="危险">危险</option>
              <option <c:if test="${param.option2 == '警告' }"> selected="selected" </c:if> value="警告">警告</option>
              <option <c:if test="${param.option2 == '正常' }"> selected="selected" </c:if> value="正常">正常</option>
            </select>
          </div>
        </div>
        
        <div class="am-u-sm-12 am-u-md-3">
          <div class="am-input-group am-input-group-sm">
            <input id="searchText" type="date" class="am-form-field" style="height: 33px;" value="${param.searchText }" max="<%=today %>">
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
                <th>序号</th>
                <th>煤炉号</th>
                <th>顶部温度</th>
                <th>底部温度</th>
                <th>状态</th>
                <th>日期 / 星期 / 时间</th>
              </tr>
              </thead>
              <tbody>
              	<c:forEach begin="${(param.page - 1) * 100 }" end="${param.page * 100 - 1 }" var="i" varStatus="status">
              	<c:if test="${status.index<fn:length(monitorHistory_list)}">
				  <c:set var="monitorHistory" value="${monitorHistory_list[i]}" />
	              <tr>
	                <td>${status.index + 1}</td>
	                <td>${monitorHistory.furnaceId}</td>
	                <td>${monitorHistory.topTemperature}</td>
	                <td>${monitorHistory.bottomTemperature}</td>
	                <td>${monitorHistory.remark}</td>
	                <td><fmt:formatDate value="${monitorHistory.date }" type="both" dateStyle="full"/></td>
	              </tr>
	            </c:if>
                </c:forEach>
              </tbody>
            </table>
            
            <div class="am-cf">
              &nbsp;共 <fmt:formatNumber type="number" value="${fn:length(monitorHistory_list) / 100 + 0.49 }" maxFractionDigits="0"/> 页 ${fn:length(monitorHistory_list) } 条记录 -- 第 ${param.page } 页
              <div class="am-fr">
                <ul class="am-pagination">
                  <li><a href="/coal-gas-system/furnace/list">返回</a></li>
                  <li><a href="javascript:changePage(1)">«</a></li>
                  
				  <c:if test="${param.page == 1 }">
	                <c:forEach begin="0" end="4" var="i" varStatus="status">
					    <li <c:if test="${param.page == (param.page + status.index) }">class="am-active"</c:if> ><a href="javascript:changePage(${param.page + status.index })">${param.page + status.index }</a></li>
					</c:forEach>
                  </c:if>
                  
				  <c:if test="${param.page == 2 }">
	                <c:forEach begin="0" end="4" var="i" varStatus="status">
					    <li <c:if test="${param.page == (param.page + status.index - 1) }">class="am-active"</c:if> ><a href="javascript:changePage(${param.page + status.index -1 })">${param.page + status.index -1 }</a></li>
					</c:forEach>
                  </c:if>
                  
				  <c:if test="${param.page == 3 }">
	                <c:forEach begin="0" end="4" var="i" varStatus="status">
					    <li <c:if test="${param.page == (param.page + status.index - 2) }">class="am-active"</c:if> ><a href="javascript:changePage(${param.page + status.index -2 })">${param.page + status.index -2 }</a></li>
					</c:forEach>
                  </c:if>
                  
                  <c:if test="${param.page == 4 && (fn:length(monitorHistory_list) / 100 - param.page) <= 1 }">
	                <c:forEach begin="0" end="4" var="i" varStatus="status">
					    <li <c:if test="${param.page == (param.page + status.index - 3) }">class="am-active"</c:if> ><a href="javascript:changePage(${param.page + status.index -3 })">${param.page + status.index -3 }</a></li>
					</c:forEach>
                  </c:if>
                  
                  <c:if test="${param.page == 5 && (fn:length(monitorHistory_list) / 100 - param.page) <= 0 }">
	                <c:forEach begin="0" end="4" var="i" varStatus="status">
					    <li <c:if test="${param.page == (param.page + status.index - 4) }">class="am-active"</c:if> ><a href="javascript:changePage(${param.page + status.index -4 })">${param.page + status.index -4 }</a></li>
					</c:forEach>
                  </c:if>
                  
				  <c:if test="${param.page >= 4 && (fn:length(monitorHistory_list) / 100 - param.page) > 1 }">
	                <c:forEach begin="0" end="4" var="i" varStatus="status">
					    <li <c:if test="${param.page == (param.page + status.index - 2) }">class="am-active"</c:if> ><a href="javascript:changePage(${param.page + status.index - 2 })">${param.page + status.index - 2 }</a></li>
					</c:forEach>
                  </c:if>
                  
				  <c:if test="${fn:length(monitorHistory_list) / 100 > 5 && (fn:length(monitorHistory_list) / 100 - param.page) > 0 && (fn:length(monitorHistory_list) / 100 - param.page) <= 1 }">
	                <c:forEach begin="0" end="4" var="i" varStatus="status">
					    <li <c:if test="${param.page == (param.page + status.index - 3) }">class="am-active"</c:if> ><a href="javascript:changePage(${param.page + status.index - 3 })">${param.page + status.index - 3 }</a></li>
					</c:forEach>
                  </c:if>
                  
				  <c:if test="${fn:length(monitorHistory_list) / 100 > 5 && (fn:length(monitorHistory_list) / 100 - param.page) > -1 && (fn:length(monitorHistory_list) / 100 - param.page) <= 0 }">
	                <c:forEach begin="0" end="4" var="i" varStatus="status">
					    <li <c:if test="${param.page == (param.page + status.index - 4) }">class="am-active"</c:if> ><a href="javascript:changePage(${param.page + status.index - 4 })">${param.page + status.index - 4 }</a></li>
					</c:forEach>
                  </c:if>
                  
                  <li><a href="javascript:changePage(${fn:substringBefore(fn:length(monitorHistory_list) / 100 + 0.99, '.') })">»</a></li>
                </ul>
              </div>
            </div>
            
            <hr />
            <p>注：.....</p>
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

	var pathname = window.location.pathname + "?furnaceId=" + ${param.furnaceId };
	var pathnamePage1 = window.location.pathname + "?furnaceId=" + ${param.furnaceId } + "&page=1";

	function changePage(page) {
		var pOption1 = "&option1=" + $('#select1 option:selected').val();
		var pOption2 = "&option2=" + $('#select2 option:selected').val();
		var pSearchText = "&searchText=" + $('#searchText').val();
		if ((page - 1) * 100 < "${fn:length(monitorHistory_list) }") {
			var search = window.location.search;
			if (search.indexOf("searchText") == -1) {
				if (search.indexOf("option1") == -1) {
					if (search.indexOf("option2") == -1) {
						location.href = pathname + "&page=" + page;
					} else {
						location.href = pathname + "&page=" + page + pOption2;
					}
				} else {
					if (search.indexOf("option2") == -1) {
						location.href = pathname + "&page=" + page + pOption1;
					} else {
						location.href = pathname + "&page=" + page + pOption1 + pOption2;
					}
				}
			} else {
				if (search.indexOf("option1") == -1) {
					if (search.indexOf("option2") == -1) {
						location.href = pathname + "&page=" + page + pSearchText;
					} else {
						location.href = pathname + "&page=" + page + pOption2 + pSearchText;
					}
				} else {
					if (search.indexOf("option2") == -1) {
						location.href = pathname + "&page=" + page + pOption1 + pSearchText;
					} else {
						location.href = pathname + "&page=" + page + pOption1 + pOption2 + pSearchText;
					}
				}
			}
		} else {
			location.href = "#"
		}
	}
	
	function selectChange1() {
		var pOption1 = "&option1=" + $('#select1 option:selected').val();
		var pOption2 = "&option2=" + $('#select2 option:selected').val();
		location.href = pathnamePage1 + pOption1 + pOption2;
	}
	
	function selectChange2() {
		var pOption1 = "&option1=" + $('#select1 option:selected').val();
		var pOption2 = "&option2=" + $('#select2 option:selected').val();
		var pSearchText = "&searchText=" + $('#searchText').val();
		if ("" == $('#searchText').val())
			location.href = pathnamePage1 + pOption1 + pOption2;
		else
			location.href = pathnamePage1 + pOption2 + pSearchText;
	}
	
	function search() {
		var pOption2 = "&option2=" + $('#select2 option:selected').val();
		var pSearchText = "&searchText=" + $('#searchText').val();
		if ("" != $('#searchText').val()) {
			location.href = pathnamePage1 + pOption2 + pSearchText;
		}
	}

</script>
<script src="/coal-gas-system/js/jquery.min.js"></script>
<script src="/coal-gas-system/js/amazeui.min.js"></script>
<script src="/coal-gas-system/js/app.js"></script>

</body>
</html>
