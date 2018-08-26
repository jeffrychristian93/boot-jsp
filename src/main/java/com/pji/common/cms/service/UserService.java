package com.pji.common.cms.service;

import com.pji.common.cms.model.request.UserRequest;
import com.pji.common.cms.model.response.UserResponse;

import javax.servlet.http.HttpServletRequest;

/**
 * @author Jeffry Christian
 * @since 13/04/2018
 */
public interface UserService {

    UserResponse getAll(HttpServletRequest request);

    UserResponse save(UserRequest userRequest, HttpServletRequest request);
}
