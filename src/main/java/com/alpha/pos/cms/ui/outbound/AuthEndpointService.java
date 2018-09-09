package com.alpha.pos.cms.ui.outbound;

import com.alpha.pos.cms.ui.constant.ApiPath;
import com.alpha.pos.cms.ui.model.request.LoginRequest;
import com.alpha.pos.cms.ui.model.response.BaseResponse;
import com.alpha.pos.cms.ui.model.response.LoginResponse;
import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.POST;

public interface AuthEndpointService {

  @POST(ApiPath.AUTH_USER_PATH)
  Call<BaseResponse<LoginResponse>> authentication(@Body LoginRequest loginRequest);
}
