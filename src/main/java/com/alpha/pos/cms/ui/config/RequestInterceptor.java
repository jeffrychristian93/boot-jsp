package com.alpha.pos.cms.ui.config;

import com.alpha.pos.cms.ui.model.response.LoginResponse;
import com.alpha.pos.cms.ui.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Objects;

@Component
public class RequestInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    AuthService authService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {

        LoginResponse loginResponse = authService.getLoginSession(request);

        String uri = request.getRequestURI();
        if (uri.equals("/error")) {
            if (Objects.isNull(loginResponse.getUser())) {
                response.sendRedirect("/login");
                return true;
            } else {
                response.sendRedirect("/");
                return true;
            }
        } else {
            if (Objects.isNull(loginResponse.getUser())) {
                if (!uri.equals("/")) {
                    if (uri.equals("/login")) {
                        return true;
                    } else {
                        response.sendRedirect("/login");
                        return false;
                    }
                } else {
                    response.sendRedirect("/login");
                    return false;
                }
            } else {
                if (uri.equals("/login")) {
                    response.sendRedirect("/");
                    return true;
                } else {
                    return true;
                }
            }
        }
    }

}
