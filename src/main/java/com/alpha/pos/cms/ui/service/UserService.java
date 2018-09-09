package com.alpha.pos.cms.ui.service;

import com.alpha.pos.cms.ui.model.request.UserRequest;
import com.alpha.pos.cms.ui.model.response.UserResponse;
import javax.servlet.http.HttpServletRequest;

public interface UserService {

    UserResponse getAll(HttpServletRequest request);

    UserResponse save(UserRequest userRequest, HttpServletRequest request);
}
