package com.alpha.pos.cms.ui.controller.auth;

import com.alpha.pos.cms.ui.model.request.LoginRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("logout")
public class LogoutController {
	private Logger log = LoggerFactory.getLogger(this.getClass());

	@RequestMapping(method = RequestMethod.GET)
	public String showForm(@ModelAttribute("login") LoginRequest login, HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		request.getSession().invalidate();
		return "auth/login";
	}

}
