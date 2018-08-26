package com.pji.common.cms.model;

import com.pji.common.cms.service.AuthService;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Objects;

/**
 * @author Jeffry Christian
 * @since 14/03/2018
 */
@Data
@NoArgsConstructor
public class ClientRequest {

    private String uri;
    private Object body;
    private HttpServletRequest httpServletRequest;
    private HttpServletResponse httpServletResponse;
    private AuthService authService;

    public ClientRequest(String uri, Object body) {
        this.uri = uri;
        this.body = body;
    }

    public ClientRequest(String uri, HttpServletRequest httpServletRequest) {
        this.uri = uri;
        this.httpServletRequest = httpServletRequest;
    }

    public ClientRequest(String uri, Object body, HttpServletRequest httpServletRequest) {
        this.uri = uri;
        this.body = body;
        this.httpServletRequest = httpServletRequest;
    }

    public ClientRequest auth(AuthService authService){
        this.authService = authService;
        return this;
    }

    WebClient.Builder builder = WebClient
            .builder()
            .baseUrl("http://192.168.90.17:8282")
            .defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE);

    public <T> Mono<T> doPost(Class<T> bodyType) {
        if (!Objects.isNull(getHttpServletRequest())) {
            builder.defaultHeader(HttpHeaders.AUTHORIZATION, "Bearer " + authService.getToken(getHttpServletRequest()));
        }
        return builder
                .build()
                .post()
                .uri(getUri())
                .body(BodyInserters.fromObject(getBody()))
                .retrieve().bodyToMono(bodyType);
    }

    public <T> Mono<T> doGet(Class<T> bodyType) {
        return builder
                .defaultHeader(HttpHeaders.AUTHORIZATION, "Bearer " + authService.getToken(getHttpServletRequest()))
                .build()
                .get()
                .uri(getUri())
                .retrieve()
                .bodyToMono(bodyType);
    }
}
