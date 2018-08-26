<%@ include file="../../taglibs.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!-- Page header -->
<div class="page-header page-header-default">
    <div class="breadcrumb-line">
        <ul class="breadcrumb">
            <li><a href="${ctx }/">Dashboard</a></li>
            <li><a href="${ctx }/user">User Management</a></li>
            <li class="active" id="mainTitle">Create New User</li>
        </ul>
    </div>
</div>
<!-- end of Page header -->

<div class="panel panel-flat" id="panel-heading">
    <div class="page-header-content border-bottom-dark-grey">
        <div class="panel-title">
            <div class="row">
                <div class="col-xs-12">
                    <h3><b>Create New User</b></h3>
                </div>
            </div>
        </div>
    </div>
    <div class="panel-body">
        <!-- content -->
        <div style="margin: 2% 5%">
            <form:form action="${ctx}/user/save" method="POST" modelAttribute="user" id="userForm">

                <div class="row form-group ${status.error ? 'has-error' : ''}">
                    <div class="col-lg-3 border-top-none">
                        <h6 class="control-label">UserName<span>*</span></h6>
                    </div>
                    <div class="col-lg-9 border-top-none">
                        <div class="col-lg-6">
                            <form:input type="text" id="userName" class="form-control" maxlength="120" path="userName" required="required"/>
                            <form:errors path="userName" class="control-label" />
                        </div>
                    </div>
                </div>

                <div class="row form-group ${status.error ? 'has-error' : ''}">
                    <div class="col-lg-3 border-top-none">
                        <h6 class="control-label">FirstName<span>*</span></h6>
                    </div>
                    <div class="col-lg-9 border-top-none">
                        <div class="col-lg-6">
                            <form:input type="text" id="firstName" class="form-control" maxlength="120" path="firstName" required="required"/>
                            <form:errors path="firstName" class="control-label" />
                        </div>
                    </div>
                </div>

                <div class="row form-group ${status.error ? 'has-error' : ''}">
                    <div class="col-lg-3 border-top-none">
                        <h6 class="control-label">LastName<span>*</span></h6>
                    </div>
                    <div class="col-lg-9 border-top-none">
                        <div class="col-lg-6">
                            <form:input type="text" id="lastName" class="form-control" maxlength="120" path="lastName" required="required"/>
                            <form:errors path="lastName" class="control-label" />
                        </div>
                    </div>
                </div>

                <div class="row form-group ${status.error ? 'has-error' : ''}">
                    <div class="col-lg-3 border-top-none">
                        <h6 class="control-label">Email<span>*</span></h6>
                    </div>
                    <div class="col-lg-9 border-top-none">
                        <div class="col-lg-6">
                            <form:input type="text" id="email" class="form-control" maxlength="120" path="email" required="required"/>
                            <form:errors path="email" class="control-label" />
                        </div>
                    </div>
                </div>

                <div class="row form-group ${status.error ? 'has-error' : ''}">
                    <div class="col-lg-3 border-top-none">
                        <h6 class="control-label">Password<span>*</span></h6>
                    </div>
                    <div class="col-lg-9 border-top-none">
                        <div class="col-lg-6">
                            <form:input type="text" id="password" class="form-control" maxlength="120" path="password" required="required"/>
                            <form:errors path="password" class="control-label" />
                        </div>
                    </div>
                </div>

                <div class="row form-group ${status.error ? 'has-error' : ''}">
                    <div class="col-lg-3 border-top-none">
                        <h6 class="control-label">Role</h6>
                    </div>
                    <div class="col-lg-9 border-top-none">
                        <div class="col-lg-6">
                            <label class="radio-inline">
                                <form:radiobutton path="authorityId" value="1" name="authorityId" checked="true"/>Admin
                            </label>
                            <label  class="radio-inline">
                                <form:radiobutton path="authorityId" value="2" name="authorityId"/>Buyer
                            </label>
                            <label  class="radio-inline">
                                <form:radiobutton path="authorityId" value="3" name="authorityId"/>Seller
                            </label>
                            <label>
                                <form:errors path="authorityId" cssClass="error" />
                            </label>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-3 pull-right border-top-none" style="margin-bottom: 50px">
                        <span class="input-group-addon"></span>
                        <button type="submit" id="buttonSubmit" class="btn bg-primary-800 btn-block">SAVE</button>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</div>