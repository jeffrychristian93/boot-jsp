package com.pji.common.cms.service;

import com.pji.common.cms.model.ClientRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import reactor.core.publisher.Mono;

import javax.servlet.http.HttpServletRequest;

/**
 * @author Jeffry Christian
 * @since 14/03/2018
 */
public interface HttpClient {

    <T> Mono<T> get(ClientRequest request, Class<T> bodyType);

    <T> Mono<T> patch(ClientRequest request, Class<T> bodyType);

    <T> Mono<T> post(ClientRequest request, Class<T> bodyType);

    <T> Mono<T> put(ClientRequest request, Class<T> bodyType);

    <T> Mono<T> delete(ClientRequest request, Class<T> bodyType);

    <T> ResponseEntity<T> create(HttpServletRequest request, String url, Object requestBody, Class<T> bodyType);

    <T> ResponseEntity<T> create(HttpServletRequest request, String url, Object requestBody, Class<T> bodyType, MultiValueMap<String, String> headers);

    <T> ResponseEntity<T> get(HttpServletRequest request, String url, Class<T> bodyType);

    <T> ResponseEntity<T> patch(HttpServletRequest request, String url, Object requestBody, Class<T> bodyType);

    <T> ResponseEntity<T> post(HttpServletRequest request, String url, Object requestBody, Class<T> bodyType);

    <T> ResponseEntity<T> post(String url, Object requestBody, Class<T> bodyType);

    <T> ResponseEntity<T> put(HttpServletRequest request, String url, Object requestBody, Class<T> bodyType);

    <T> ResponseEntity<T> delete(HttpServletRequest request, String url, Object requestBody, Class<T> bodyType);

    MultiValueMap<String, String> initSecureHeaders(HttpServletRequest request);
}
