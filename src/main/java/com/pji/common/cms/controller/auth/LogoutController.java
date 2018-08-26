package com.pji.common.cms.controller.auth;

import com.pji.common.cms.model.request.LoginRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Jeffry Christian
 * @since 14/03/2018
 */
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
