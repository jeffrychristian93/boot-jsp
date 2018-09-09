package com.alpha.pos.cms.ui.controller.auth;

import com.alpha.pos.cms.ui.model.request.LoginRequest;
import com.alpha.pos.cms.ui.model.response.BaseResponse;
import com.alpha.pos.cms.ui.model.response.LoginResponse;
import com.alpha.pos.cms.ui.service.AuthService;
import java.util.Objects;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
		BaseResponse<LoginResponse> loginResponse = authService.login(login);

		if (!Objects.isNull(loginResponse)) {
			authService.setLoginSession(loginResponse.getData(), request);
			return "redirect:/";
		} else {
			model.put("code", loginResponse.getCode());
			model.put("message", loginResponse.getMessage());
			return "auth/login";
		}
	}
}
