<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<script type="text/javascript" src="${ctx }/assets/js/multiselect.min.js"></script>

<div class="content-wrapper">
    <!-- Page header -->
    <div class="page-header page-header-default">
        <div class="breadcrumb-line">
            <ul class="breadcrumb">
                <li><a href="${ctx }/main">Dashboard</a></li>
                <li><a href="#">Alfamikro</a></li>
                <li><a href="${ctx }/categoryManagement">Category Management</a></li>
                <li class="active" id="mainTitle"><c:out value="${title}"></c:out></li>
            </ul>
        </div>
    </div>
    <!-- end of Page header -->
    <div class="content">
        <div class="panel panel-flat" id="panel-heading">
            <div class="page-header-content border-bottom-dark-grey">
                <div class="panel-title">
                    <div class="row">
                        <div class="col-xs-1 margin-top-bottom-25px">
                            <a href="${ctx}/categoryManagement">
                                <span class="glyphicon glyphicon-arrow-left"></span>
                            </a>
                        </div>
                        <div class="col-xs-11">
                            <h3><b><c:out value="${title}"></c:out></b></h3>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-body">
                <!-- content -->
                <div style="margin: 2% 5%">
                <form:form action="${ctx}${action}" method="POST" commandName="category" id="mainCategoryForm" enctype="multipart/form-data">
	           	
					<div class="row form-group ${status.error ? 'has-error' : ''}">
						<div class="col-lg-3 border-top-none">
							<label>
								<h6 class="control-label">Id</h6>
							</label>
						</div>
						<div class="col-lg-9 border-top-none">
							<div class="col-lg-6">
								<form:input type="number" id="categoryId" class="form-control" maxlength="120" path="categoryId" readonly="true" placeholder="Auto Increment" />
								<form:errors path="categoryId" class="control-label" />
							</div>
						</div>
					</div>

					<div class="row form-group ${status.error ? 'has-error' : ''}">
						<div class="col-lg-3 border-top-none">
							<h6 class="control-label">Category Name <span>*</span></h6>
						</div>
						<div class="col-lg-9 border-top-none">
							<div class="col-lg-6">
								<form:input type="text" id="categoryName" class="form-control" maxlength="120" path="categoryName" required="required" onchange="changeName(categoryName.value)" />
								<form:errors path="categoryName" class="control-label" />
							</div>
						</div>
					</div>

					<div class="row form-group ${status.error ? 'has-error' : ''}">
						<div class="col-lg-3 border-top-none">
							<h6 class="control-label">Sub Category 1 <span>*</span></h6>
						</div>
						<div class="col-lg-9 border-top-none">
							<div class="row">
								<div class="col-xs-5">
									<form:select path="subCategoryFrom" name="subCategoryFrom[]" id="multiselect1" class="form-control" size="8" multiple="multiple">
										<c:forEach var="o" items="${subCategories}">
											<form:option value="${o.tascId}">${o.tascName}</form:option>
										</c:forEach>
									</form:select>
								</div>

								<div class="col-xs-1">
									<button type="button" style="visibility: hidden; margin-top: 10%" id="btnHide_" class="btn btn-primary"><i class="glyphicon glyphicon-forward"></i></button>
									<button type="button" style="margin-top: 10%" id="multiselect1_rightAll" class="btn btn-primary"><i class="glyphicon glyphicon-forward"></i></button>
									<button type="button" style="margin-top: 10%" id="multiselect1_rightSelected" class="btn btn-primary"><i class="glyphicon glyphicon-chevron-right"></i></button>
									<button type="button" style="margin-top: 10%" id="multiselect1_leftSelected" class="btn btn-primary"><i class="glyphicon glyphicon-chevron-left"></i></button>
									<button type="button" style="margin-top: 10%" id="multiselect1_leftAll" class="btn btn-primary"><i class="glyphicon glyphicon-backward"></i></button>
								</div>

								<div class="col-xs-5">
									<form:select path="subCategoryTo" name="subCategoryTo[]" id="multiselect1_to" class="form-control" size="8" multiple="multiple">
										<c:choose>
											<c:when test="${!empty subCategoriesTo}">
												<c:forEach var="o" items="${subCategoriesTo}">
													<form:option value="${o.tascId}">${o.tascName}</form:option>
												</c:forEach>
											</c:when>
										</c:choose>
									</form:select>
								</div>
							</div>
						</div>
					</div>

						<div class="row form-group ${status.error ? 'has-error' : ''}"
							style="display: none">
							<div class="col-lg-3 border-top-none">
								<h6 class="control-label">Image Path</h6>
							</div>
							<div class="col-lg-9 border-top-none">
								<div class="col-lg-6">
									<form:input type="text" id="imagePath" class="form-control"
										path="imagePath" />
								</div>
							</div>
						</div>

						<div class="row form-group ${status.error ? 'has-error' : ''}">
						<div class="col-lg-3 border-top-none">
							<h6 class="control-label">Upload Image <span>* </span> <span> <i id="iguide" class="fa fa-info-circle fa-lg" aria-hidden="true"></i>
                            </span></h6>
                            <p class="color-gray">Format: .JPG .JPEG .PNG<br>Min Resolusi: 300 x 300 px<br>Ukuran: Max 100kb</p>
						</div>
							<div class="col-lg-9 border-top-none">
								<div class="col-lg-3">
									<div class="icon-upload-image-static-page cursor-pointer"
										id="imageUpload">
										<input id="imageFile" name="imageFile"
											onchange="readURL(this)" class="file_upload" type="file"
											style="display: none;" accept="image/*" /> <input
											type="file" id="fileselect" name="file"
											style="display: none;" />
										<div id="successImage" class="success-image">
											<img id="imgCover" src="" />
										</div>
									</div>
									<div class="text-align-center padding-top-12px min-height-80px">
										<button onclick="reUploadImage()" id="btnImage" type="button"
											class="btn-browse btn-primary btn-xs" hidden="true">
											Upload</button>
									</div>
								</div>
							</div>
						</div>

					<div class="row form-group ${status.error ? 'has-error' : ''}">
						<div class="col-lg-3 border-top-none">
							<h6 class="control-label">Sort Order <span>*</span></h6>
						</div>
						<div class="col-lg-9 border-top-none">
							<div class="col-lg-6">
								<form:input type="number" name="sortNo" class="form-control" min="1" max="100" path="sortNo" required="true" />
								<form:errors path="sortNo" class="control-label" />
							</div>
						</div>
					</div>

					<div class="row form-group ${status.error ? 'has-error' : ''}">
						<div class="col-lg-3 border-top-none">
							<h6 class="control-label">Floor</h6>
						</div>
						<div class="col-lg-9 border-top-none">
							<div class="col-lg-6">
								<label class="radio-inline">
									<form:radiobutton path="floor" value="YES" name="floor" id="rdYes" checked="true"/>Yes
								</label>
								<label  class="radio-inline">
									<form:radiobutton path="floor" value="NO" name="floor" id="rdNo"/>No
								</label>
								<label>
									<form:errors path="floor" cssClass="error" />
								</label>
							</div>
						</div>
					</div>

					<div class="row form-group ${status.error ? 'has-error' : ''}">
						<div class="col-lg-3 border-top-none" id="floorSkuLbl">
							<h6 class="control-label">Floor SKU</h6>
						</div>
							<div class="col-lg-9 border-top-none" id="floorSku">
								<div class="row">
									<div class="col-xs-5">
										<form:select path="floorSKUFrom" name="floorSKUFrom[]"
											id="multiselect2" class="form-control" size="8"
											multiple="multiple">
											<c:forEach var="o" items="${floors}">
												<form:option value="${o.productId}">${o.productSku} - ${o.productName}</form:option>
											</c:forEach>
										</form:select>
									</div>

									<div class="col-xs-1">
										<div style="height: 100px"></div>
										<button type="button" style="margin-top: 10%"
											id="multiselect2_rightSelected" class="btn btn-primary">
											<i class="glyphicon glyphicon-chevron-right"></i>
										</button>
										<button type="button" style="margin-top: 10%; display: none" id="multiselect2_leftAll" class="btn btn-primary"><i class="glyphicon glyphicon-backward"></i></button>
									</div>

									<div class="col-xs-5">
										<span> Result </span>
										<div class="btn-group col-sm-offset-4" role="group" aria-label="...">
											<button type="button" id="multiselect2_move_up"
												class="btn btn-default">
												<i class="glyphicon glyphicon-triangle-top"></i>
											</button>
											<button type="button" id="multiselect2_move_down"
												class="btn btn-default">
												<i class="glyphicon glyphicon-triangle-bottom"></i>
											</button>
											<button type="button" id="multiselect2_leftSelected"
												class="btn btn-default">
												<i class="glyphicon glyphicon-trash"></i>
											</button>
										</div>
										
										<form:select path="floorSKUTo" name="floorSKUTo[]"
											id="multiselect2_to" class="form-control" size="8"
											multiple="multiple">
											<c:choose>
												<c:when test="${!empty floorsTo}">
													<c:forEach var="o" items="${floorsTo}">
														<form:option value="${o.productId}">${o.productSku} - ${o.productName}</form:option>
													</c:forEach>
												</c:when>
											</c:choose>
										</form:select>
									</div>
								</div>
							</div>
						</div>

					<div class="row form-group ${status.error ? 'has-error' : ''}">
						<div class="col-lg-3 border-top-none">
							<h6 class="panel-title">Status</h6>
						</div>
						<div class="col-lg-9 border-top-none">
							<div class="col-lg-6">
								<form:select class="form-control" path="status" id="status" name="status">
									<form:option value="26">Active</form:option>
									<form:option value="27">Inactive</form:option>
								</form:select>
								<form:errors path="status" class="control-label" />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-3 pull-right border-top-none"
							style="margin-bottom: 50px">
							<span class="input-group-addon"></span>
							<button type="submit" id="buttonSubmit"
								class="btn bg-primary-800 btn-block">SAVE</button>
						</div>
					</div>
				</form:form>
				</div>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="guideline" tabindex="-1" role="dialog"
	aria-labelledby="guidelineModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header"
				style="border-bottom: 1px solid #ddd; padding-bottom: 10px">
				<button type="button" class="close glyphicon glyphicon-remove"
					aria-label="Close" data-dismiss="modal" style="padding-right: 10px">
					<span aria-hidden="true"></span>
				</button>
				<h4 class="modal-title" id="myModalLabel">
					<strong>Guideline Images Alfamikro Application</strong>
				</h4>
			</div>
			<div class="modal-body height-auto">
				<div class="thumbnail">
					<div class="thumb">
						<img src="${ctx}/assets/images/guideline_alfamikro_images.png"
							alt="" />
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$("#iguide").on("click", function() {
	$("#guideline").modal('show');
});
</script>

<script type="text/javascript">
function changeName(val) {
	var name = val;
	$.ajax({
		url: ctx + "/categoryManagement/mainByName/" + name,
		data: "",
		success: function(response) {
			if (response.categoryName != null) {
				swal({
			         title: name + ' already exist!',
			         text: 'Please insert a new name.',
			         type: 'warning',
			         allowOutsideClick: false
			    });
				$('#categoryName').val('');
			}
		}
	});
}
</script>

<script type="text/javascript">
$(document).ready(function() {
    window.prettyPrint && prettyPrint();
    $('#multiselect1').multiselect({
        search: {
            left: '<input type="text" name="q" class="form-control" placeholder="Search..." />',
            right: '<input type="text" name="q" class="form-control" placeholder="Search..." />',
        },
        fireSearch: function(value) {
            return value.length > 3;
        }
    });
    $('#multiselect2').multiselect({
        search: {
            left: '<input type="text" name="q" id="floorSkuSearch" class="form-control" placeholder="Search..." />',
        },
        fireSearch: function(value) {
            return value.length > 3;
        }
    });
});
</script>

<script type="text/javascript">
function searchFloorSku(val) {
	console.log("tes : " + val);
	$.ajax({
		url: ctx + "/categoryManagement/floorSku/" + val,
		data: "",
		success: function(response) {
			$("#multiselect2").append(response);
		}
	});
}
</script>

<script type="text/javascript">
$(document).ready(function() {
	$('input#floorSkuSearch').on('input', function() {
		if( this.value.length < 3 ) {
			$('#multiselect2 option').remove();
			return;
		} else if (this.value.length > 2) {
			searchFloorSku(this.value);
		}
	});
});
</script>

<script type="text/javascript">
$(".icon-upload-image-static-page").on("click",function(e){
	if (!$(e.target).is('#imageFile'))
		$("#imageFile").trigger("click");
});

	//re upload image
function reUploadImage(){
	$("#imageFile").trigger("click");
}
</script>

<script type="text/javascript">
//view image
var fileStatus = false;
function readURL(input) {
    if (input.files && input.files[0]) {
    	var ext = $('#imageFile').val().split('.').pop().toLowerCase();
    	var picsize = (input.files[0].size);
    	if ($.inArray(ext, ['gif','png','jpg','jpeg']) == -1){
    		swal({
		        title: 'Invalid Image Format!',
		        html: 'Image Format Must Be JPG, JPEG, PNG or GIF.',
		        type: 'warning',
		        allowOutsideClick: false
		    }).then(function() {
		    	$("#iguide").trigger("click");
		    });
    		$('#successImage').hide();
    		if($('#btnImage').is(":visible")){
        		$("#imageUpload").addClass("icon-upload-image-static-page cursor-pointer").removeAttr("style").on('click', function(e){if (!$(e.target).is('#imageFile')){$("#imageFile").trigger("click");}});
        	} else {
        		$("#imageUpload").addClass("icon-upload-image-static-page cursor-pointer").removeAttr("style");	
        	}
            $('#btnImage').attr('hidden', true);
    		fileStatus = false;
    	} else if (picsize > 100000){
    		swal({
		        title: 'Warning!',
		        html: 'Maximum File Size Limit is 100KB.',
		        type: 'warning',
		        allowOutsideClick: false
		    }).then(function() {
		    	$("#iguide").trigger("click");
		    });
    		$('#successImage').hide();
    		if($('#btnImage').is(":visible")){
        		$("#imageUpload").addClass("icon-upload-image-static-page cursor-pointer").removeAttr("style").on('click', function(e){if (!$(e.target).is('#imageFile')){$("#imageFile").trigger("click");}});
        	} else {
        		$("#imageUpload").addClass("icon-upload-image-static-page cursor-pointer").removeAttr("style");	
        	}
            $('#btnImage').attr('hidden', true);
    		fileStatus = false;
    	} else {
    		var _URL = window.URL || window.webkitURL;
			var img = new Image();
            img.src = _URL.createObjectURL(input.files[0]);
            img.onload = function() {
            	if (this.width < 300 || this.height < 300) {
                	swal({
        		        title: 'Warning!',
        		        html: 'Minimum resolution is 300x300 px',
        		        type: 'warning',
        		        allowOutsideClick: false
        		    }).then(function() {
        		    	$("#iguide").trigger("click");
        		    });
                	$('#successImage').hide();
                	if($('#btnImage').is(":visible")){
                		$("#imageUpload").addClass("icon-upload-image-static-page cursor-pointer").removeAttr("style").on('click', function(e){if (!$(e.target).is('#imageFile')){$("#imageFile").trigger("click");}});
                	} else {
                		$("#imageUpload").addClass("icon-upload-image-static-page cursor-pointer").removeAttr("style");	
                	}
                    $('#btnImage').attr('hidden', true);
            		fileStatus = false;
                } else {
                	var reader = new FileReader();
                    reader.onload = function (e) {
                    	$('#successImage').show();
                    	$('#imgCover').attr('src', e.target.result).width(150).height(150);
                    };
                    reader.readAsDataURL(input.files[0]);
                    
                    $("#imageUpload").css('background-image','none').css('padding','0').css('cursor','default');//.off('click');
                    $('#btnImage').removeAttr('hidden');
                    fileStatus = true;	
                }
            	_URL.revokeObjectURL(img.src);
            };
    	}
    }
}
</script>

<script type="text/javascript">
$(document).ready(function() {
	if($('#mainTitle').text()=='Edit Main Category'){
		if ('${imageShow}' !== "") {
			$('#successImage').show();
			$('#imgCover').attr('src', '${imageShow}').width(150).height(150);
			
			$("#imageUpload").css('background-image','none').css('padding','0').css('cursor','default').off('click');
		    $('#btnImage').removeAttr('hidden');
		}
	};
});
</script>

<script type="text/javascript">
$(function() {
    var status= "${saveResponse}";
    if (status !== ''){
        if (String(status) === 'SUCCESS') {
            swal({
                title: 'Success!',
                text: 'Main category has been saved',
                type: 'success',
                allowOutsideClick: false
            }).then(function() {
                window.location.href = ctx+'/categoryManagement';
            });
        } else {
            swal({
                title: 'Failed!',
                text: 'Failed to save main category',
                type: 'error',
                allowOutsideClick: false
            }).then(function() {
                window.location.href = ctx+'/categoryManagement';
            });
        }
    }
});
</script>

<script type="text/javascript">
$(document).ready(function() {
	if ('${category.floor}' === 'NO') {
		$('#floorSkuLbl').css('color', 'grey');
    	$('#floorSku').css('display', 'none');
	}
	
    $('input[type=radio][name=floor]').change(function() {
        if (this.value == 'YES') {
        	$('#floorSkuLbl').css('color', 'black');
        	$('#floorSku').css('display', '');
        }
        else if (this.value == 'NO') {
        	$('#floorSkuLbl').css('color', 'grey');
        	$('#floorSku').css('display', 'none');
        	$( "#multiselect2_leftAll" ).trigger( "click" );
        }
    });
});
</script>

<script type="text/javascript">
var imagePath = $("#imagePath").val();
	
$("#mainCategoryForm").submit(function(event) {
	if ($("#multiselect1_to option").val() == undefined) {
		event.preventDefault();
		swal({
	        title: 'Warning!',
	        html: 'No sub category selected',
	        type: 'warning',
	        allowOutsideClick: false
	    });
	}else if (!fileStatus && imagePath === '') {
		event.preventDefault();
		swal({
	        title: 'Warning!',
	        html: 'No Image selected',
	        type: 'warning',
	        allowOutsideClick: false
	    });
	}
});
</script>