<%@page pageEncoding="utf-8" %>
<div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
  <div class="am-offcanvas-bar admin-offcanvas-bar">
    <ul class="am-list admin-sidebar-list">
      <li><a href="/coal-gas-system/depot/list?page=1"><span class="am-icon-home"></span> 首页</a></li>
      <li><a href="/coal-gas-system/staff/information"><span class="am-icon-check"></span> 个人资料<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
      <li class="admin-parent">
        <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file"></span> 生产信息<span class="am-icon-angle-right am-fr am-margin-right"></span></a>
        <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
	      <li><a href="/coal-gas-system/depot/list?page=1"><span class="am-icon-table"></span> 仓库</a></li>
	      <li><a href="/coal-gas-system/dry/list?page=1"><span class="am-icon-table"></span> 干燥</a></li>
	      <li><a href="/coal-gas-system/furnace/list?page=1"><span class="am-icon-table"></span> 监控</a></li>
	      <li><a href="/coal-gas-system/product/list?page=1"><span class="am-icon-table"></span> 产品</a></li>
	      <li><a href="/coal-gas-system/transport/list?page=1"><span class="am-icon-table"></span> 输送</a></li>
	      <li><a href="/coal-gas-system/order/list?page=1"><span class="am-icon-table"></span> 订单</a></li>
        </ul>
      </li>
      <li><a href="/coal-gas-system/staff/list?page=1"><span class="am-icon-calendar"></span> 员工</a></li>
      <li><a href="/coal-gas-system/map"><span class="am-icon-th"></span> 地图导航</a></li>
      <li><a href="/coal-gas-system/help"><span class="am-icon-puzzle-piece"></span> 帮助页</a></li>
      <li><a href="/coal-gas-system/logout"><span class="am-icon-sign-out"></span> 注销</a></li>
    </ul>

    <div class="am-panel am-panel-default admin-sidebar-panel">
      <div class="am-panel-bd">
        <p><span class="am-icon-bookmark"></span> 公告</p>
        <p>今天下午3点全员到三楼会议室开会。—— 经理部</p>
      </div>
    </div>

    <div class="am-panel am-panel-default admin-sidebar-panel">
      <div class="am-panel-bd">
        <p><span class="am-icon-tag"></span> 便签</p>
        <p>Welcome to coal gas system!</p>
      </div>
    </div>
  </div>
</div>