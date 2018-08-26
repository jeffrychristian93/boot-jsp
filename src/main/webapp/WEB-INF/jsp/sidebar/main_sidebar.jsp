<%@ page import="com.pji.common.cms.model.response.SidebarMenuResponse" %>
<%@ page import="com.pji.common.cms.service.impl.AuthServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pji.common.cms.model.response.SidebarMenuBodyResponse" %>
<%@ page import="com.pji.common.cms.model.response.SidebarSubMenuBodyResponse" %>
<%@ include file="../../jsp/taglibs.jsp"%>

<!-- Main sidebar -->
<div class="sidebar sidebar-main sidebar-default">
	<div class="sidebar-content">

		<div class="sidebar-user-material">
			<div class="category-content">
				<div class="sidebar-user-material-content">
					<a href="#"><img src="http://localhost:8383/assets/images/placeholder.jpg" class="img-circle img-responsive" alt=""></a>
					<h6>Victoria Baker</h6>
					<span class="text-size-small">Santa Ana, CA</span>
				</div>

				<div class="sidebar-user-material-menu">
					<a href="#user-nav" data-toggle="collapse"><span>My account</span> <i class="caret"></i></a>
				</div>
			</div>

			<div class="navigation-wrapper collapse" id="user-nav">
				<ul class="navigation">
					<li><a href="#"><i class="icon-user-plus"></i> <span>My profile</span></a></li>
					<li><a href="#"><i class="icon-coins"></i> <span>My balance</span></a></li>
					<li><a href="#"><i class="icon-comment-discussion"></i> <span><span class="badge bg-teal-400 pull-right">58</span> Messages</span></a></li>
					<li class="divider"></li>
					<li><a href="#"><i class="icon-cog5"></i> <span>Account settings</span></a></li>
					<li><a href="#"><i class="icon-switch2"></i> <span>Logout</span></a></li>
				</ul>
			</div>
		</div>
		<!-- /user menu -->


		<!-- Main navigation -->
		<div class="sidebar-category sidebar-category-visible">
			<div class="category-content no-padding">
				<ul class="navigation navigation-main navigation-accordion">

					<!-- Main -->
					<li class="navigation-header"><span>Main</span> <i class="icon-menu" title="Main pages"></i></li>
					<li><a href="index.html"><i class="icon-home4"></i> <span>Dashboard</span></a></li>
					<%
						//Parent MenuResponse Here

						AuthServiceImpl service = new AuthServiceImpl();

						String pathUrl = (String) service.getSession(request, "mainPathUrl");
						SidebarMenuResponse listParentMenuResponse =  (SidebarMenuResponse) service.getSession(request, "sessionSidebar");
						String subMenuActive = "";
						for(SidebarMenuBodyResponse parentMenuResponse : listParentMenuResponse.getBody().getMenus()){
					%>
					<li id="<%=parentMenuResponse.getMenuCode()%>" class="">
						<a href="#"><i></i> <span><%=parentMenuResponse.getTitle() %></span></a>
						<ul>
							<%
								List<SidebarSubMenuBodyResponse> listSubMenuResponses = parentMenuResponse.getSubMenus();
								for(SidebarSubMenuBodyResponse subMenuResponse : listSubMenuResponses){
									if ((request.getContextPath() + subMenuResponse.getUrl()).equals(request.getAttribute("javax.servlet.forward.request_uri"))) {
										subMenuActive = "active";
									} else {
										subMenuActive = "";
									}
							%>
							<li class="<%=subMenuActive%>"><a href="<%= request.getContextPath() %>${ctx}<%=subMenuResponse.getUrl()%>"><%=subMenuResponse.getTitle()%></a></li>
							<%
								}
							%>
						</ul>
					</li>
					<%
						}
					%>
					<!--<li>-->
						<!--<a href="#"><i class="icon-stack2"></i> <span>Page layouts</span></a>-->
						<!--<ul>-->
							<!--<li><a href="layout_navbar_fixed.html">Fixed navbar</a></li>-->
							<!--<li class="active"><a href="layout_navbar_sidebar_fixed.html">Fixed navbar &amp; sidebar</a></li>-->
							<!--<li><a href="layout_sidebar_fixed_native.html">Fixed sidebar native scroll</a></li>-->
						<!--</ul>-->
					<!--</li>-->
				</ul>
			</div>
		</div>
		<!-- /main navigation -->

	</div>
</div>
<!-- /main sidebar -->