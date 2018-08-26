<%@ include file="../jsp/taglibs.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="author" content="">
	<link rel="icon" href="${ctx }/assets/images/favicon-pji-64.ico">
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
	<script type="text/javascript" src="${ctx}/assets/js/core/libraries/jquery_ui/core.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/forms/selects/selectboxit.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/forms/inputs/typeahead/typeahead.bundle.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/forms/tags/tagsinput.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/forms/tags/tokenfield.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/forms/inputs/touchspin.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/forms/inputs/maxlength.min.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/plugins/forms/inputs/formatter.min.js"></script>
	
	<script type="text/javascript" src="${ctx}/assets/js/core/app.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/pages/form_floating_labels.js"></script>

	<script type="text/javascript" src="${ctx}/assets/js/plugins/ui/ripple.min.js"></script>
	<!-- /theme JS files -->

</head>

<body class="login-container">

		<!-- Header -->
		<tiles:insertAttribute name="header" />
		<!-- End Header -->
		<!-- Content -->
		
		<!-- Page container -->
	<div class="page-container">

		<!-- Page content -->
		<div class="page-content">

			<!-- Main content -->
			<div class="content-wrapper">

				<!-- Content area -->
				<div class="content">
		
		<tiles:insertAttribute name="body" />
		<!-- End Content -->
		<!-- Footer -->
		<tiles:insertAttribute name="footer" />
		<!-- End Footer -->
		
		</div>
				<!-- /content area -->

			</div>
			<!-- /main content -->

		</div>
		<!-- /page content -->

	</div>
	<!-- /page container -->
		
	<script type="text/javascript">
		var ctx = "${ctx }";
		var contextDomain = "${contextDomain}"
	</script>

</body>

</html>