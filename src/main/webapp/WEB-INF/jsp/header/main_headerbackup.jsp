<%@ include file="../taglibs.jsp"%>
<div class="navbar navbar-inverse bg-white">
		<div class="navbar-header bg-alfa">
			<a class="navbar-brand" href="index.html"><img src="${ctx}/assets/images/logo_pji_login_white.png" alt=""></a>

			<ul class="nav navbar-nav visible-xs-block">
				<li><a data-toggle="collapse" data-target="#navbar-mobile"><i class="icon-tree5"></i></a></li>
				<li><a class="sidebar-mobile-main-toggle"><i class="icon-paragraph-justify3"></i></a></li>
			</ul>
		</div>

		<div class="navbar-collapse collapse" id="navbar-mobile">
			<ul class="nav navbar-nav">
				<li><a class="sidebar-control sidebar-main-toggle hidden-xs"><i class="icon-paragraph-justify3"></i></a></li>
			</ul>

			<div class="navbar-right">
				<p class="navbar-text"><%=request.getAttribute("sessionUserEmail") %></p>
			</div>
		</div>
	</div>