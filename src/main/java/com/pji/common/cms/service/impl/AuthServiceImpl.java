package com.pji.common.cms.service.impl;

import com.google.gson.Gson;
import com.pji.common.cms.model.ClientRequest;
import com.pji.common.cms.model.request.LoginRequest;
import com.pji.common.cms.model.response.LoginResponse;
import com.pji.common.cms.service.AuthService;
import com.pji.common.cms.service.HttpClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Mono;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Objects;

/**
 * @author Jeffry Christian
 * @since 14/03/2018
 */
@Service
public class AuthServiceImpl implements AuthService {

    @Autowired
    private HttpClient httpClient;

    @Value("${api.auth}")
    private String url;

    @Override
    public LoginResponse login(LoginRequest loginRequest) {

        ResponseEntity<LoginResponse> result = httpClient.post(url, loginRequest, LoginResponse.class);

        return result.getBody();
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
