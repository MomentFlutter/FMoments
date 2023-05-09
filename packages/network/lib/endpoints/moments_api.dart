import "package:dio/dio.dart";
import "package:retrofit/http.dart";

import "../model/moments_user_info_resp.dart";

part "moments_api.g.dart";

@RestApi()
abstract class MomentsApi {
  factory MomentsApi(Dio dio) = _MomentsApi;

  @GET("moments-data/user.json")
  Future<MomentUserInfoResp> fetchUserInfo();
}
