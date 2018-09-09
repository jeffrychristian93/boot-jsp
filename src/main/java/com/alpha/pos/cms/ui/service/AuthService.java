package com.alpha.pos.cms.ui.service;

import com.alpha.pos.cms.ui.model.request.LoginRequest;
import com.alpha.pos.cms.ui.model.response.BaseResponse;
import com.alpha.pos.cms.ui.model.response.LoginResponse;
import javax.servlet.http.HttpServletRequest;

public interface AuthService {

    BaseResponse<LoginResponse> login(LoginRequest loginRequest);

    void setLoginSession(LoginResponse loginResponse, HttpServletRequest request);

    LoginResponse getLoginSession(HttpServletRequest request);

    void setSession(HttpServletRequest request, String attrId, Object obj);

    Object getSession(HttpServletRequest request, String attrId);

    String getToken(HttpServletRequest request);
}
