<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>出库记录</title>
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
  <style type="text/css">
  	div.remark_info
		{
		    position: absolute;
		    z-index: 1000;
		    min-width: 150px;
		    min-height: 40px;
		    display: none;
		    padding: 3px;
		    overflow: visible;
		    text-align: left;
		    color: #F37B1D;
		}
  </style>
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
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">出库历史</strong> / <small>OutBound History</small></div>
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
              <option <c:if test="${param.option2 == '品类 & 备注' }"> selected="selected" </c:if> value="品类&备注">品类 & 备注</option>
              <option <c:if test="${param.option2 == '高等' }"> selected="selected" </c:if> value="高等">高等</option>
              <option <c:if test="${param.option2 == '中等' }"> selected="selected" </c:if> value="中等">中等</option>
              <option <c:if test="${param.option2 == '低等' }"> selected="selected" </c:if> value="低等">低等</option>
              <option <c:if test="${param.option2 == '正常' }"> selected="selected" </c:if> value="正常">正常</option>
              <option <c:if test="${param.option2 == '异常' }"> selected="selected" </c:if> value="异常">异常</option>
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
                <th style="text-align:center;">序号</th>
                <th style="text-align:center;">仓库号</th>
                <th>品类</th>
                <th>产地</th>
                <th style="text-align:center;">煤炉号</th>
                <th>数量/t</th>
                <th>单价/￥</th>
                <th>总价/￥</th>
                <th>确认人</th>
                <th>星期</th>
                <th>出库时间</th>
                <th>备注</th>
              </tr>
              </thead>
              
              <tbody>
                <c:forEach begin="${(param.page - 1) * 10 }" end="${param.page * 10 - 1 }" var="i" varStatus="status">
                <c:if test="${status.index<fn:length(outbound_list)}">
				  <c:set var="outbound" value="${outbound_list[i]}" />
	              <tr>
	                <td align="center">${status.index + 1}</td>
	                <td align="center">${outbound.depotId }</td>
	                <td>${outbound.name }</td>
	                <td>${outbound.place }</td>
	                <td align="center">${outbound.furnaceId }</td>
	                <td>${outbound.amount }</td>
	                <td>${outbound.unitPrice }</td>
	                <td>${outbound.totalPrice }</td>
	                <td>${outbound.comfirmPerson }</td>
	                <td><fmt:formatDate value="${outbound.outboundDate}" pattern="EEEE"/></td>
	                <td><fmt:formatDate value="${outbound.outboundDate}" pattern="yyyy-MM-dd aa hh:mm"/></td>
	                <td>
	                	<c:if test="${'' != outbound.remark && null != outbound.remark }"><a style="cursor: crosshair; color: red;" onmouseover="showRemark(true, this);" onmouseout="showRemark(false, this);">异常</a></c:if>
	                	<c:if test="${'' == outbound.remark || null == outbound.remark }">正常</c:if>
	                	<div id="remark" class="remark_info">
	                		${outbound.remark }
	                	</div>
	                </td>
	                <td>
	                  <div class="am-btn-toolbar">
	                    <div class="am-btn-group am-btn-group-xs">
	                      <button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" 
	                      		onclick="location.href='/coal-gas-system/outbound/detail?id=${outbound.id }'">
	                      		<span class="am-icon-pencil-square-o"></span> 查看</button>
	                      <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" 
	                      		onclick="deleteOutBound(${outbound.id })"><span class="am-icon-trash-o"></span> 删除</button>
	                    </div>
	                  </div>
	                </td>
	              </tr>
	            </c:if>
                </c:forEach>
                
                <tr>
	                <td align="center">总计</td>
	                <td></td>
	                <td></td>
	                <td></td>
	                <td></td>
	                <td>${sumAmount }</td>
	                <td>${averagePrice }</td>
	                <td>${sumPrice }</td>
	                <td></td>
	                <td></td>
	                <td></td>
	                <td></td>
	                <td></td>
	            </tr>
                
              </tbody>
            </table>
            
            <div class="am-cf">
              &nbsp;共 <fmt:formatNumber type="number" value="${fn:length(outbound_list) / 10 + 0.49 }" maxFractionDigits="0"/> 页 ${fn:length(outbound_list) } 条记录 -- 第 ${param.page } 页
              <div class="am-fr">
                <ul class="am-pagination">
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
                  
                  <c:if test="${param.page == 4 && (fn:length(outbound_list) / 10 - param.page) <= 1 }">
	                <c:forEach begin="0" end="4" var="i" varStatus="status">
					    <li <c:if test="${param.page == (param.page + status.index - 3) }">class="am-active"</c:if> ><a href="javascript:changePage(${param.page + status.index -3 })">${param.page + status.index -3 }</a></li>
					</c:forEach>
                  </c:if>
                  
                  <c:if test="${param.page == 5 && (fn:length(outbound_list) / 10 - param.page) <= 0 }">
	                <c:forEach begin="0" end="4" var="i" varStatus="status">
					    <li <c:if test="${param.page == (param.page + status.index - 4) }">class="am-active"</c:if> ><a href="javascript:changePage(${param.page + status.index -4 })">${param.page + status.index -4 }</a></li>
					</c:forEach>
                  </c:if>
                  
				  <c:if test="${param.page >= 4 && (fn:length(outbound_list) / 10 - param.page) > 1 }">
	                <c:forEach begin="0" end="4" var="i" varStatus="status">
					    <li <c:if test="${param.page == (param.page + status.index - 2) }">class="am-active"</c:if> ><a href="javascript:changePage(${param.page + status.index - 2 })">${param.page + status.index - 2 }</a></li>
					</c:forEach>
                  </c:if>
                  
				  <c:if test="${fn:length(outbound_list) / 10 > 5 && (fn:length(outbound_list) / 10 - param.page) > 0 && (fn:length(outbound_list) / 10 - param.page) <= 1 }">
	                <c:forEach begin="0" end="4" var="i" varStatus="status">
					    <li <c:if test="${param.page == (param.page + status.index - 3) }">class="am-active"</c:if> ><a href="javascript:changePage(${param.page + status.index - 3 })">${param.page + status.index - 3 }</a></li>
					</c:forEach>
                  </c:if>
                  
				  <c:if test="${fn:length(outbound_list) / 10 > 5 && (fn:length(outbound_list) / 10 - param.page) > -1 && (fn:length(outbound_list) / 10 - param.page) <= 0 }">
	                <c:forEach begin="0" end="4" var="i" varStatus="status">
					    <li <c:if test="${param.page == (param.page + status.index - 4) }">class="am-active"</c:if> ><a href="javascript:changePage(${param.page + status.index - 4 })">${param.page + status.index - 4 }</a></li>
					</c:forEach>
                  </c:if>
                  
                  <li><a href="javascript:changePage(${fn:substringBefore(fn:length(outbound_list) / 10 + 0.99, '.') })">»</a></li>
                </ul>
              </div>
            </div>
            
            <button type="button" style="margin-left: 10px; background: #3BB4F2; border: 1px #3BB4F2 solid;" class="am-btn am-btn-primary am-btn-xs" 
            	onclick="location.href='/coal-gas-system/depot/list?page=1'">&nbsp;返回&nbsp;</button>
            
            <hr />
            <p>注：.....</p>
          </form>
        </div>

      </div>
    </div>

    <c:import url="../../footer.jsp"></c:import>

  </div>
  <!-- content end -->
</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<script type="text/javascript">

	var pathname = window.location.pathname + "?";
	var pathnamePage1 = window.location.pathname + "?page=1";
	
	function changePage(page) {
		var pOption1 = "&option1=" + $('#select1 option:selected').val();
		var pOption2 = "&option2=" + $('#select2 option:selected').val();
		var pSearchText = "&searchText=" + $('#searchText').val();
		if ("" != "${param.id }") {
			pathname += "id=${param.id }"
		}
		if ((page - 1) * 10 < "${fn:length(outbound_list) }") {
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
		if ("" != "${param.id }") {
			pathnamePage1 += "&id=${param.id }"
		}
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

	function showRemark(flag, e) {
		if (flag)
			e.parentNode.getElementsByTagName("div")[0].style.display = "block";
	    else
	    	e.parentNode.getElementsByTagName("div")[0].style.display = "none";
	}

	function deleteOutBound(id) {
		if ('A' == "${user.role}" || 'B' == "${user.role}") {
			if (window.confirm("确定删除此条记录？")) {
				var xhr = getXhr();
				xhr.open("get", "/coal-gas-system/outbound/delete?id=" + id, true);
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						window.location.reload();
					}
				}
				xhr.send();
			}
		} else
			alert("无删除权限");
	}
	
	document.onkeydown = function(e) {
	   	if((e.keyCode || e.which) == 13) {
	   		if("searchText" == document.activeElement.id) {
		   		document.getElementById("search").click();
	   		}
	   	}
	}

</script>
<script src="/coal-gas-system/js/ajax.js"></script>
<script src="/coal-gas-system/js/jquery.min.js"></script>
<script src="/coal-gas-system/js/amazeui.min.js"></script>
<script src="/coal-gas-system/js/app.js"></script>

</body>
</html>
