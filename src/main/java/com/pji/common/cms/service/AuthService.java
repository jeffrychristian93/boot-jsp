package com.pji.common.cms.service;

import com.pji.common.cms.model.request.LoginRequest;
import com.pji.common.cms.model.response.LoginResponse;

import javax.servlet.http.HttpServletRequest;

/**
 * @author Jeffry Christian
 * @since 14/03/2018
 */
public interface AuthService {

    LoginResponse login(LoginRequest loginRequest);

    void setLoginSession(LoginResponse loginResponse, HttpServletRequest request);

    LoginResponse getLoginSession(HttpServletRequest request);

    void setSession(HttpServletRequest request, String attrId, Object obj);

    Object getSession(HttpServletRequest request, String attrId);

    String getToken(HttpServletRequest request);
}
