package com.pji.common.cms.service.impl;

import com.pji.common.cms.model.ClientRequest;
import com.pji.common.cms.model.request.UserRequest;
import com.pji.common.cms.model.response.UserResponse;
import com.pji.common.cms.service.HttpClient;
import com.pji.common.cms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Mono;

import javax.servlet.http.HttpServletRequest;

/**
 * @author Jeffry Christian
 * @since 13/04/2018
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private HttpClient httpClient;

    @Override
    public UserResponse getAll(HttpServletRequest request) {
        Mono<UserResponse> response = httpClient.get(new ClientRequest("/api/user/getAll", request), UserResponse.class);
        return response.block();
    }

    @Override
    public UserResponse save(UserRequest userRequest, HttpServletRequest request){
        Mono <UserResponse> response = httpClient.post(new ClientRequest("/api/user", userRequest, request) , UserResponse.class);
        return response.block();
    }

}
