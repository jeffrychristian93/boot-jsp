package com.alpha.pos.cms.ui.service.impl;

import com.alpha.pos.cms.ui.model.request.UserRequest;
import com.alpha.pos.cms.ui.model.response.UserResponse;
import com.alpha.pos.cms.ui.service.UserService;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Override
    public UserResponse getAll(HttpServletRequest request) {
        return null;
    }

    @Override
    public UserResponse save(UserRequest userRequest, HttpServletRequest request){
        return null;
    }

}
