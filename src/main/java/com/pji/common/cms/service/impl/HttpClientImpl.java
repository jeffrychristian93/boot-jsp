package com.pji.common.cms.service.impl;

import com.pji.common.cms.model.ClientRequest;
import com.pji.common.cms.service.AuthService;
import com.pji.common.cms.service.HttpClient;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import reactor.core.publisher.Mono;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Jeffry Christian
 * @since 14/03/2018
 */
@Service
public class HttpClientImpl implements HttpClient, InitializingBean {

    @Autowired
    private AuthService authService;

    private RestTemplate template;

    @Override
    public <T> Mono<T> get(ClientRequest request, Class<T> bodyType) {
        return request.auth(authService).doGet(bodyType);
    }

    @Override
    public <T> Mono<T> patch(ClientRequest request, Class<T> bodyType) {
        return null;
    }

    @Override
    public <T> Mono<T> post(ClientRequest request, Class<T> bodyType) {
        return request.auth(authService).doPost(bodyType);
    }

    @Override
    public <T> Mono<T> put(ClientRequest request, Class<T> bodyType) {
        return null;
    }

    @Override
    public <T> Mono<T> delete(ClientRequest request, Class<T> bodyType) {
        return null;
    }

    @Override
    public <T> ResponseEntity<T> get(HttpServletRequest request, String url, Class<T> bodyType){
        HttpHeaders headers = new HttpHeaders();
        headers.set(HttpHeaders.AUTHORIZATION, "Bearer " + authService.getToken(request));
        HttpEntity entity = new HttpEntity(headers);
        return template.exchange(url, HttpMethod.GET, entity, bodyType);
    }

    @Override
    public <T> ResponseEntity<T> create(HttpServletRequest request, String url, Object requestBody, Class<T> bodyType){
        return null;
    }

    @Override
    public <T> ResponseEntity<T> create(HttpServletRequest request, String url, Object requestBody, Class<T> bodyType, MultiValueMap<String, String> headers){
        return null;
    }

    @Override
    public <T> ResponseEntity<T> patch(HttpServletRequest request, String url, Object requestBody, Class<T> bodyType){
        MultiValueMap<String, String> headers = initSecureHeaders(request);
        HttpEntity entity = new HttpEntity<>(requestBody, headers);
        return template.exchange(url, HttpMethod.PATCH, entity, bodyType);
    }

    @Override
    public <T> ResponseEntity<T> post(HttpServletRequest request, String url, Object requestBody, Class<T> bodyType){
        MultiValueMap<String, String> headers = initSecureHeaders(request);
        HttpEntity entity = new HttpEntity<>(requestBody, headers);
        return template.exchange(url, HttpMethod.POST, entity, bodyType);
    }

    @Override
    public <T> ResponseEntity<T> post(String url, Object requestBody, Class<T> bodyType){
        HttpEntity entity = new HttpEntity<>(requestBody);
        return template.exchange(url, HttpMethod.POST, entity, bodyType);
    }


    @Override
    public <T> ResponseEntity<T> put(HttpServletRequest request, String url, Object requestBody, Class<T> bodyType){
        MultiValueMap<String, String> headers = initSecureHeaders(request);
        HttpEntity entity = new HttpEntity<>(requestBody, headers);
        return template.exchange(url, HttpMethod.PUT, entity, bodyType);
    }


    @Override
    public <T> ResponseEntity<T> delete(HttpServletRequest request, String url, Object requestBody, Class<T> bodyType){
        MultiValueMap<String, String> headers = initSecureHeaders(request);
        HttpEntity entity = new HttpEntity<>(requestBody, headers);
        return template.exchange(url, HttpMethod.DELETE, entity, bodyType);
    }


    @Override
    public MultiValueMap<String, String> initSecureHeaders(HttpServletRequest request){
        MultiValueMap<String, String> headers = new LinkedMultiValueMap<>();
        headers.add(HttpHeaders.AUTHORIZATION, "Bearer " + authService.getToken(request));
        headers.add(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE);
        return headers;
    }


    @Override
    public void afterPropertiesSet() throws Exception{
        template = new RestTemplate();
    }
}
