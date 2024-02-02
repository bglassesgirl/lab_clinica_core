import 'package:clinica_core/src/restClient/auth_interceptors.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

final class RestClient extends DioForNative {
  RestClient(String baseUrl)
      : super(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 60),
            receiveTimeout: const Duration(seconds: 60),
          ),
        ) {
    interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
      AuthInterceptors(),
    ]);
  }

  RestClient get auth {
    options.extra['OTO_AUTH_KEY'] = true;
    return this;
  }

  RestClient get unAuth {
    options.extra['OTO_AUTH_KEY'] = false;
    return this;
  }
}
