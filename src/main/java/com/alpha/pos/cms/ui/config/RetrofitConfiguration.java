package com.alpha.pos.cms.ui.config;

import com.alpha.pos.cms.ui.outbound.AuthEndpointService;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.ObjectMapper;
import okhttp3.OkHttpClient;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import retrofit2.Retrofit;
import retrofit2.converter.jackson.JacksonConverterFactory;

@Configuration
@ConditionalOnClass(Retrofit.class)
public class RetrofitConfiguration {

  @Bean(name = "retrofitGateway")
  public Retrofit retrofitLocation(
      AlphaGatewayProperties alphaGatewayProperties,
      @Qualifier(value = "GatewayHttpClient") OkHttpClient okHttpLocationClient) {
    Retrofit.Builder builder = new Retrofit.Builder();
    if (okHttpLocationClient != null) {
      builder.client(okHttpLocationClient);
    }
    builder.baseUrl(alphaGatewayProperties.getHost());
    ObjectMapper objectMapper = new ObjectMapper();
    objectMapper.configure(JsonParser.Feature.ALLOW_NUMERIC_LEADING_ZEROS, true);
    builder.addConverterFactory(JacksonConverterFactory.create(objectMapper));
    return builder.build();
  }

  @Bean(name = "AuthEndpointService")
  public AuthEndpointService retrofitAuthService(
      @Qualifier(value = "retrofitGateway") Retrofit retrofitLocation) {
    return retrofitLocation.create(AuthEndpointService.class);
  }

}
