import "package:dio/dio.dart";
import "package:retrofit/retrofit.dart";

import "../model/login_req.dart";
import "../model/login_resp.dart";

part "login_api.g.dart";

@RestApi()
abstract class LoginApi {
  factory LoginApi(Dio dio) = _LoginApi;

  @POST("auth/login")
  Future<LoginResp> login(
    @Body() LoginReq login, [
    @CancelRequest() CancelToken? cancelToken,
  ]);
}
