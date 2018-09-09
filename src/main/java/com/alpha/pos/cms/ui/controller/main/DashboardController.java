package com.alpha.pos.cms.ui.controller.main;

import com.alpha.pos.cms.ui.model.AuthorityName;
import com.alpha.pos.cms.ui.model.SidebarMenu;
import com.alpha.pos.cms.ui.model.response.LoginResponse;
import com.alpha.pos.cms.ui.model.response.UserResponse;
import com.alpha.pos.cms.ui.service.AuthService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping(value = "/")
public class DashboardController {

    @Autowired
    private AuthService authService;

    @GetMapping
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
        LoginResponse loginResponse = authService.getLoginSession(request);
        UserResponse user = loginResponse.getUser();
        List<AuthorityName> authorityName = user.getRoles();
        ModelAndView mv = new ModelAndView("main/main");
        SidebarMenu sidebars = new SidebarMenu(user.getMenuAccess());
        authService.setSession(request, "sessionSidebar", sidebars);
        return mv;
    }
}
