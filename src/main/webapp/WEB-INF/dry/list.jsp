<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>干燥</title>
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
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">干燥</strong> / <small>Dry</small></div>
      </div>

      <hr>

      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-6" style="width: 345px;">
          <div class="am-btn-toolbar">
            <div class="am-btn-group am-btn-group-xs">
              <button type="button" class="am-btn am-btn-default" onclick="location.href='/coal-gas-system/dry/add'"><span class="am-icon-plus"></span> 新增</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 保存</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-archive"></span> 审核</button>
              <button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button>
            </div>
          </div>
        </div>
        
        <div class="am-u-sm-12 am-u-md-3" style="width: 240px;">
          <div class="am-form-group">
            <select id="select1" data-am-selected="{btnSize: 'sm'}" onchange="selectChange()">
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
			<select id="select2" data-am-selected="{btnSize: 'sm'}" onchange="selectChange()">
			  <option <c:if test="${param.option2 == '达标 & 备注' }"> selected="selected" </c:if> value="所有">达标 &amp; 备注</option>
			  <option <c:if test="${param.option2 == '达标' }"> selected="selected" </c:if> value="达标">达标</option>
			  <option <c:if test="${param.option2 == '不达标' }"> selected="selected" </c:if> value="不达标">不达标</option>
			  <option <c:if test="${param.option2 == '有备注' }"> selected="selected" </c:if> value="有备注">有备注</option>
			  <option <c:if test="${param.option2 == '无备注' }"> selected="selected" </c:if> value="无备注">无备注</option>
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
                <th style="text-align: center;">序号</th>
                <th>仓库号</th>
                <th>干燥前/吨</th>
                <th>干燥后/吨</th>
                <th>干燥率</th>
                <th>干燥时长/h</th>
                <th>星期</th>
                <th>干燥日期/时间</th>
                <th>确认人</th>
                <th>备注</th>
                <th>操作</th>
              </tr>
              </thead>
              <tbody>
                <c:forEach begin="${(param.page - 1) * 20 }" end="${param.page * 20 - 1 }" var="i" varStatus="status">
				<c:if test="${status.index<fn:length(dry_list)}">
				  <c:set var="dry" value="${dry_list[i]}" />
	              <tr>
	                <td><input type="checkbox" /></td>
	                <td align="center">${status.index + 1}</td>
	                <td><a href="/coal-gas-system/depot/detail?id=${dry.coalDepotId }">${dry.coalDepotId }号仓</a></td>
	                <td>${dry.formerAmount }</td>
	                <td>${dry.laterAmount }</td>
	                <td <c:if test="${dry.dryPercent < 0.7 }">style="color: red;"</c:if> >${dry.dryPercent }</td>
	                <td>${dry.dryTime }</td>
	                <td><fmt:formatDate value="${dry.date}" pattern="EEEE"/></td>
	                <td><fmt:formatDate value="${dry.date}" pattern="yyyy年MM月dd日 HH:mm"/></td>
	                <td>${dry.confirmPerson }</td>
	                <td>
	                	<c:if test="${'' == dry.remark }">无</c:if>
	                	<c:if test="${'' != dry.remark }">有</c:if>
	                </td>
	                <td>
	                  <div class="am-btn-toolbar">
	                    <div class="am-btn-group am-btn-group-xs">
	                      <button type="button" class="am-btn am-btn-default am-btn-xs am-text-secondary" onclick="location.href='/coal-gas-system/dry/edit?id=${dry.id }'"><span class="am-icon-pencil-square-o"></span> 编辑</button>
	                      <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only" onclick="deleteDry(${dry.id })"><span class="am-icon-trash-o"></span> 删除</button>
	                    </div>
	                  </div>
	                </td>
	              </tr>
	            </c:if>
                </c:forEach>
              </tbody>
            </table>
            
            <div class="am-cf">
              &nbsp;共 <fmt:formatNumber type="number" value="${fn:length(dry_list) / 20 + 0.49 }" maxFractionDigits="0"/> 页 ${fn:length(dry_list) } 条记录 -- 第 ${param.page } 页
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
                  
                  <c:if test="${param.page == 4 && (fn:length(dry_list) / 20 - param.page) <= 1 }">
	                <c:forEach begin="0" end="4" var="i" varStatus="status">
					    <li <c:if test="${param.page == (param.page + status.index - 3) }">class="am-active"</c:if> ><a href="javascript:changePage(${param.page + status.index -3 })">${param.page + status.index -3 }</a></li>
					</c:forEach>
                  </c:if>
                  
                  <c:if test="${param.page == 5 && (fn:length(dry_list) / 20 - param.page) <= 0 }">
	                <c:forEach begin="0" end="4" var="i" varStatus="status">
					    <li <c:if test="${param.page == (param.page + status.index - 4) }">class="am-active"</c:if> ><a href="javascript:changePage(${param.page + status.index -4 })">${param.page + status.index -4 }</a></li>
					</c:forEach>
                  </c:if>
                  
				  <c:if test="${param.page >= 4 && (fn:length(dry_list) / 20 - param.page) > 1 }">
	                <c:forEach begin="0" end="4" var="i" varStatus="status">
					    <li <c:if test="${param.page == (param.page + status.index - 2) }">class="am-active"</c:if> ><a href="javascript:changePage(${param.page + status.index - 2 })">${param.page + status.index - 2 }</a></li>
					</c:forEach>
                  </c:if>
                  
				  <c:if test="${fn:length(dry_list) / 20 > 5 && (fn:length(dry_list) / 20 - param.page) > 0 && (fn:length(dry_list) / 20 - param.page) <= 1 }">
	                <c:forEach begin="0" end="4" var="i" varStatus="status">
					    <li <c:if test="${param.page == (param.page + status.index - 3) }">class="am-active"</c:if> ><a href="javascript:changePage(${param.page + status.index - 3 })">${param.page + status.index - 3 }</a></li>
					</c:forEach>
                  </c:if>
                  
				  <c:if test="${fn:length(dry_list) / 20 > 5 && (fn:length(dry_list) / 20 - param.page) > -1 && (fn:length(dry_list) / 20 - param.page) <= 0 }">
	                <c:forEach begin="0" end="4" var="i" varStatus="status">
					    <li <c:if test="${param.page == (param.page + status.index - 4) }">class="am-active"</c:if> ><a href="javascript:changePage(${param.page + status.index - 4 })">${param.page + status.index - 4 }</a></li>
					</c:forEach>
                  </c:if>
                  
                  <li><a href="javascript:changePage(${fn:substringBefore(fn:length(dry_list) / 20 + 0.99, '.') })">»</a></li>
                </ul>
              </div>
            </div>
            
            <hr />
            <p>注：干燥率低于0.7为不达标。</p>
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
 
	var pathname = window.location.pathname;
	var pathnamePage1 = window.location.pathname + "?page=1";
	
	function deleteDry(id) {
		if ('A' == "${user.role}" || 'B' == "${user.role}" || 'C' == "${user.role}") {
			if (window.confirm("确定删除此干燥记录？")) {
				var xhr = getXhr();
				xhr.open("get", "/coal-gas-system/dry/delete?id=" + id, true);
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
	
	function changePage(page) {
		var pOption1 = "&option1=" + $('#select1 option:selected').val();
		var pOption2 = "&option2=" + $('#select2 option:selected').val();
		var pSearchText = "&searchText=" + $('#searchText').val();
		if ((page - 1) * 20 < "${fn:length(dry_list) }") {
			var search = window.location.search;
			if (search.indexOf("searchText") == -1) {
				if (search.indexOf("option1") == -1) {
					if (search.indexOf("option2") == -1) {
						location.href = pathname + "?page=" + page;
					} else {
						location.href = pathname + "?page=" + page + pOption2;
					}
				} else {
					if (search.indexOf("option2") == -1) {
						location.href = pathname + "?page=" + page + pOption1;
					} else {
						location.href = pathname + "?page=" + page + pOption1 + pOption2;
					}
				}
			} else {
				if (search.indexOf("option1") == -1) {
					if (search.indexOf("option2") == -1) {
						location.href = pathname + "?page=" + page + pSearchText;
					} else {
						location.href = pathname + "?page=" + page + pOption2 + pSearchText;
					}
				} else {
					if (search.indexOf("option2") == -1) {
						location.href = pathname + "?page=" + page + pOption1 + pSearchText;
					} else {
						location.href = pathname + "?page=" + page + pOption1 + pOption2 + pSearchText;
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

</script>
<script src="/coal-gas-system/js/ajax.js"></script>
<script src="/coal-gas-system/js/jquery.min.js"></script>
<script src="/coal-gas-system/js/amazeui.min.js"></script>
<script src="/coal-gas-system/js/app.js"></script>

</body>
</html>
