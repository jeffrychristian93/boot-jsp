package com.pji.common.cms.controller.main;

import com.pji.common.cms.model.AuthorityName;
import com.pji.common.cms.model.response.LoginResponse;
import com.pji.common.cms.model.response.SidebarMenuResponse;
import com.pji.common.cms.model.response.UserBodyResponse;
import com.pji.common.cms.service.AuthService;
import com.pji.common.cms.service.SidebarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Jeffry Christian
 * @since 14/03/2018
 */
@RestController
@RequestMapping(value = "/")
public class DashboardController {

    @Autowired
    private AuthService authService;

    @Autowired
    private SidebarService sidebarService;

    @GetMapping
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response,
                              @Value("${api.menu.sidebar.admin}") String urlMenuAdmin) {
        LoginResponse loginResponse = authService.getLoginSession(request);
        UserBodyResponse user = loginResponse.getUser();
        AuthorityName authorityName = user.getAuthorityName();
        ModelAndView mv = new ModelAndView("main/main");
        String url = "";
//        switch (authorityName) {
//            case ROLE_ADMIN:
                url = urlMenuAdmin;
//                break;
//            case ROLE_BUYER:
//                url = "/api/menu/buyer";
//                break;
//            case ROLE_SELLER:
//                url = "/api/menu/seller";
//                break;
//        }
        SidebarMenuResponse sidebars = sidebarService.getSidebarMenus(url, request);
        authService.setSession(request, "sessionSidebar", sidebars);
        return mv;
    }
}
