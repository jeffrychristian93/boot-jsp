<%@ include file="../../jsp/taglibs.jsp" %>

<!-- login form -->
<c:if test="${code == '601' }">
    <c:set var="usr_has_error" value="has-error"/>
</c:if>
<c:if test="${code == '602' }">
    <c:set var="pass_has_error" value="has-error"/>
</c:if>


<form:form method="post" modelAttribute="login" action="${ctx }/login">
    <div class="panel panel-body login-form">
        <div class="text-center">
            <div class="icon-object border-slate-300 text-slate-300"><i class="icon-reading"></i></div>
            <h5 class="content-group">Login to your account
                <small class="display-block">Enter your credentials below</small>
            </h5>
        </div>

        <div class="form-group has-feedback ${ usr_has_error} has-feedback-left">
            <form:input path="username" type="text" class="form-control " id="username" placeholder="Username" />
            <c:if test="${ usr_has_error != null}">
                <span class="help-block">User name is empty</span>
            </c:if>
            <div class="form-control-feedback">
                <i class="icon-user text-muted"></i>
            </div>
        </div>

        <div class="form-group has-feedback ${ usr_has_error} has-feedback-left">
            <form:input path="password" type="text" class="form-control " id="password" placeholder="Password" />
            <c:if test="${ pass_has_error != null}">
                <span class="help-block">Password is empty</span>
            </c:if>
            <div class="form-control-feedback">
                <i class="icon-lock2 text-muted"></i>
            </div>
        </div>

        <div class="form-group">
            <button type="submit" class="btn bg-pink-400 btn-block">Login<i class="icon-circle-right2 position-right"></i></button>
        </div>

        <div class="text-center">
            <a href="#">Forgot password?</a>
        </div>
    </div>
</form:form>
<!-- / login form -->