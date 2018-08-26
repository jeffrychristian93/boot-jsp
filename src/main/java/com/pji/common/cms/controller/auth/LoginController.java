package com.pji.common.cms.controller.auth;

import com.pji.common.cms.model.request.LoginRequest;
import com.pji.common.cms.model.response.LoginResponse;
import com.pji.common.cms.service.AuthService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Objects;

/**
 * @author Jeffry Christian
 * @since 14/03/2018
 */
@Controller
@RequestMapping("login")
public class LoginController {
	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	AuthService authService;

	@RequestMapping(method = RequestMethod.GET)
	public String showForm(@ModelAttribute("login") LoginRequest login, HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		log.info(request.getParameter("startTime"));
		return "auth/login";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String postLogin(@ModelAttribute("login") LoginRequest login, HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		LoginResponse loginResponse = authService.login(login);

		if (!Objects.isNull(loginResponse)) {
			authService.setLoginSession(loginResponse, request);
			return "redirect:/";
		} else {
			model.put("code", loginResponse.getStatus().getCode());
			model.put("message", loginResponse.getStatus().getMessage());
			return "auth/login";
		}
	}
}
