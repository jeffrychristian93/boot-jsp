package com.alpha.pos.cms.ui.config;

import java.util.concurrent.TimeUnit;
import okhttp3.OkHttpClient;
import okhttp3.logging.HttpLoggingInterceptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;

@Configuration
@ConditionalOnClass(OkHttpClient.class)
public class OkHttpConfiguration {

  public static final Logger LOGGER = LoggerFactory.getLogger(OkHttpConfiguration.class);

  @Bean(name = "GatewayHttpClient")
  public OkHttpClient okHttpImageHttpClient(
      AlphaGatewayProperties alphaGatewayProperties) {

    HttpLoggingInterceptor httpLoggingInterceptor = new HttpLoggingInterceptor(LOGGER::info);

    httpLoggingInterceptor
        .setLevel(HttpLoggingInterceptor.Level.valueOf(alphaGatewayProperties.getLogLevel()));

    OkHttpClient.Builder builder = new OkHttpClient.Builder()
        .addInterceptor(httpLoggingInterceptor)
        .connectTimeout(alphaGatewayProperties.getConnectTimeout(), TimeUnit.MILLISECONDS)
        .readTimeout(alphaGatewayProperties.getReadTimeout(), TimeUnit.MILLISECONDS)
        .writeTimeout(alphaGatewayProperties.getReadTimeout(), TimeUnit.MILLISECONDS);
    builder.addInterceptor(
        chain -> chain.proceed(chain.request().newBuilder()
            .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
            .build()));

    return builder.build();
  }

}
