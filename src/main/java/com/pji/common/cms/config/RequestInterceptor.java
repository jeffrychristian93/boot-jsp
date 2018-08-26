package com.pji.common.cms.config;

import com.pji.common.cms.model.response.LoginResponse;
import com.pji.common.cms.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Objects;

/**
 * @author Jeffry Christian
 * @since 13/03/2018
 */
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