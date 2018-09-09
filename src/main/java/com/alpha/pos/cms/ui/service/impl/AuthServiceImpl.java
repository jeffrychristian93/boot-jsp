package com.alpha.pos.cms.ui.service.impl;

import com.alpha.pos.cms.ui.model.request.LoginRequest;
import com.alpha.pos.cms.ui.model.response.BaseResponse;
import com.alpha.pos.cms.ui.model.response.LoginResponse;
import com.alpha.pos.cms.ui.outbound.AuthEndpointService;
import com.alpha.pos.cms.ui.service.AuthService;
import com.google.gson.Gson;
import java.util.Objects;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import retrofit2.Response;

@Service
public class AuthServiceImpl implements AuthService {

    @Autowired
    private AuthEndpointService authEndpointService;

    @Override
    public BaseResponse<LoginResponse> login(LoginRequest loginRequest) {

        try {
            Response<BaseResponse<LoginResponse>> response = authEndpointService
                .authentication(loginRequest).execute();
            BaseResponse<LoginResponse> result = response.body();
            if (Objects.isNull(result)) {
                return null;
            }
            return result;
        } catch (Exception e) {
            return null;
        }

    }

    @Override
    public void setLoginSession(LoginResponse loginResponse, HttpServletRequest request) {
        Gson gson = new Gson();
        String loginSession = gson.toJson(loginResponse);
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(60 * 60);
        session.setAttribute("LOGIN_SESSION", loginSession);
    }

    @Override
    public LoginResponse getLoginSession(HttpServletRequest request) {
        Gson gson = new Gson();
        HttpSession session = request.getSession();
        LoginResponse login = new LoginResponse();
        String loginSession = (String) session.getAttribute("LOGIN_SESSION");

        if (!Objects.isNull(loginSession)) {
            login = gson.fromJson(loginSession, LoginResponse.class);
        }

        return login;
    }

    @Override
    public void setSession(HttpServletRequest request, String attrId, Object obj) {
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(60 * 60);
        session.setAttribute(attrId, obj);
    }

    @Override
    public Object getSession(HttpServletRequest request, String attrId) {
        HttpSession session = request.getSession();
        return session.getAttribute(attrId);
    }

    @Override
    public String getToken(HttpServletRequest request) {
        return getLoginSession(request).getToken();
    }


}
