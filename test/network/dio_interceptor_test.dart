import "package:dio/dio.dart";
import "package:flutter_starter/network/dio_interceptor.dart";
import "package:flutter_test/flutter_test.dart";

var printLog = [];

void print(String s) => printLog.add(s);

void main() {
  group("Test for Interceptors", () {
    test("Test for Request", () {
      DioInterceptor dioInterceptor = new DioInterceptor();
      RequestOptions requestOptions = RequestOptions(path: "");
      RequestInterceptorHandler requestInterceptorHandler =
          RequestInterceptorHandler();

      dioInterceptor.onRequest(requestOptions, requestInterceptorHandler);

      expect(
        requestOptions.headers["Content-Type"],
        equals("application/json"),
      );
    });

    // test("Test for Error Code 400", () {
    //   DioInterceptor dioInterceptor = new DioInterceptor();
    //   RequestOptions requestOptions = RequestOptions(path: "");
    //   DioError dioError = DioError(
    //     error: {"message": "Bad Request"},
    //     requestOptions: requestOptions,
    //     response: Response(
    //       statusCode: 400,
    //       requestOptions: requestOptions,
    //     ),
    //     type: DioErrorType.other,
    //   );
    //
    //   Map<String, String> vair = {"message": "Bad Request"};
    //
    //   ErrorInterceptorHandler errorInterceptorHandler =
    //       ErrorInterceptorHandler();
    //   dioInterceptor.onError(dioError, errorInterceptorHandler);
    //
    //   expect(dioError.error, vair);
    // });
  });
}
