<%@page import="com.pji.common.cms.model.response.LoginResponse"%>
<%@ include file="../jsp/taglibs.jsp"%>
<%@ page import="com.pji.common.cms.service.impl.AuthServiceImpl"%>

	<!DOCTYPE html>
	<html lang="en">
	<title><tiles:insertAttribute name="title" /></title>
	<meta name="description" content="<tiles:insertAttribute name="description" />" />
	<meta name="keywords" content="<tiles:insertAttribute name="keywords" />" />
	<meta name="robots" content="<tiles:insertAttribute name="robots" />" />

	<!-- Global stylesheets -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
	<link href="${ctx}/assets/css/icons/icomoon/styles.css" rel="stylesheet" type="text/css">
	<link href="${ctx}/assets/css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="${ctx}/assets/css/core.css" rel="stylesheet" type="text/css">
	<link href="${ctx}/assets/css/components.css" rel="stylesheet" type="text/css">
	<link href="${ctx}/assets/css/colors.css" rel="stylesheet" type="text/css">
	<!--<link href="${ctx}/assets/css/style.css" rel="stylesheet" type="text/css">-->
	<!-- /global stylesheets -->

	<!-- Core JS files -->
	<script type="text/javascript" src="${ctx}/assets/js/plugins/loaders/pace.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/core/libraries/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/core/libraries/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/loaders/blockui.min.js"></script>
	<!-- /core JS files -->

	<!-- Theme JS files -->
	<script type="text/javascript" src="${ctx}/assets/js/core/libraries/jasny_bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/forms/selects/select2.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/forms/selects/bootstrap_multiselect.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/forms/selects/bootstrap_select.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/forms/styling/uniform.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/forms/styling/switchery.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/forms/styling/switch.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/core/libraries/jquery_ui/core.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/forms/selects/selectboxit.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/forms/inputs/typeahead/typeahead.bundle.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/forms/tags/tagsinput.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/forms/tags/tokenfield.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/forms/inputs/touchspin.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/forms/inputs/maxlength.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/forms/inputs/formatter.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/ui/moment/moment.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/pickers/datepicker.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/pagination/bootpag.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/pagination/bs_pagination.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/pagination/datepaginator.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/uploaders/dropzone.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/tables/datatables/datatables.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/tables/datatables/extensions/fixed_columns.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/tables/datatables/extensions/buttons.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/notifications/sweet_alert.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/core/libraries/jquery_ui/interactions.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/core/libraries/jquery_ui/widgets.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/core/libraries/jquery_ui/effects.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/extensions/mousewheel.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/core/libraries/jquery_ui/globalize/globalize.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/core/libraries/jquery_ui/globalize/cultures/globalize.culture.de-DE.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/core/libraries/jquery_ui/globalize/cultures/globalize.culture.ja-JP.js"></script>

	<script type="text/javascript" src="${ctx}/assets/js/core/app.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/pages/form_inputs.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/pages/form_floating_labels.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/pages/components_pagination.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/pages/uploader_dropzone.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/pages/datatables_api.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/pages/datatables_extension_fixed_columns.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/pages/datatables_extension_buttons_init.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/pages/jqueryui_forms.js"></script>

	<%-- <script type="text/javascript" src="${ctx}/assets/js/pages/dashboard.js"></script> --%>


	<script type="text/javascript" src="${ctx}/assets/js/plugins/ui/ripple.min.js"></script>
	<!-- /theme JS files -->

</head>

<%
AuthServiceImpl authServiceImpl = new AuthServiceImpl();

LoginResponse login = authServiceImpl.getLoginSession(request);
request.setAttribute("sessionUserEmail", login.getUser().getEmail());
request.setAttribute("sessionUserId", login.getUser().getId());
//request.setAttribute("sessionParentMenu", login.getParentMenu());
%>

<body>

	<!-- Header -->
	<tiles:insertAttribute name="header" />
	<!-- End Header -->
	
	<!-- Page container -->
	<div class="page-container">
		
		
		
		<!-- Page content -->
		<div class="page-content">
				
			<jsp:include page="../jsp/sidebar/main_sidebar.jsp">
				<jsp:param name="parent_menu" value="" />
			</jsp:include>
			
			<!-- Main content -->
			<div class="content-wrapper">

				<jsp:include page="../jsp/header/page_header.jsp">
					<jsp:param name="corporate_name" value="" />
				</jsp:include>
				
					<!-- Content area -->
				<div class="content">
					<tiles:insertAttribute name="body" />
					<!-- End Content -->
					
					<!-- Footer -->
					<tiles:insertAttribute name="footer" />
					<!-- End Footer -->
				</div>	
				<!-- Content area -->
			</div>
				
		</div>
		
	</div>
	

	<script type="text/javascript">
		var ctx = "${ctx }";
		var contextDomain = "${contextDomain}"
	</script>

</body>

</html>