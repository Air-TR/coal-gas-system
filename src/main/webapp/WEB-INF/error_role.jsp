<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>No Permission</title>
<meta name="description" content="这是一个404页面">
<meta name="keywords" content="404">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="/coal-gas-system/i/favicon.png">
<link rel="apple-touch-icon-precomposed"
	href="/coal-gas-system/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="/coal-gas-system/css/amazeui.min.css" />
<link rel="stylesheet" href="/coal-gas-system/css/admin.css">
</head>
<body>

	<!-- header -->
	<c:import url="header.jsp"></c:import>

	<div class="am-cf admin-main">
		<!-- sidebar -->
		<c:import url="sidebar.jsp"></c:import>

		<!-- content start -->
		<div class="admin-content">
			<div class="admin-content-body">
				<div class="am-cf am-padding am-padding-bottom-0">
					<div class="am-fl am-cf">
						<strong class="am-text-primary am-text-lg">No Permission</strong>
						/ <small>That’s an error</small>
					</div>
				</div>

				<hr>

				<div class="am-g">
					<div class="am-u-sm-12">
						<h2 class="am-text-center am-text-xxxl am-margin-top-lg">No
							Permission</h2>
						<p class="am-text-center">权限不足</p>
						<pre class="page-404">
          .----.
       _.'__    `.
   .--($)($$)---/#\
 .' @          /###\
 :         ,   #####
  `-..__.-' _.-\###/
        `;_:    `"'
      .'"""""`.
     /,  ya ,\\
    //  Error!  \\
    `-._______.-'
    ___`. | .'___
   (______|______)
        </pre>
					</div>
				</div>
			</div>

			<c:import url="footer.jsp"></c:import>
		</div>
		<!-- content end -->

	</div>

	<a href="#"
		class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
		data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

	<script src="/coal-gas-system/js/jquery.min.js"></script>
	<script src="/coal-gas-system/js/amazeui.min.js"></script>
	<script src="/coal-gas-system/js/app.js"></script>

</body>
</html>
