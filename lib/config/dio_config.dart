import 'package:dio/dio.dart';
import 'package:yuktidea_assignment/services/storage_service.dart';
import 'package:yuktidea_assignment/utils/app_constants.dart';

class DioConfig {
  DioConfig._();

  static final instance = DioConfig._();

  static const int connectionTimeout = 30000;
  static const int receiveTimeout = 30000;

  BaseOptions options = BaseOptions(
    connectTimeout: const Duration(milliseconds: connectionTimeout),
    receiveTimeout: const Duration(milliseconds: receiveTimeout),
    responseType: ResponseType.json,
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${StorageService.instance.fetch(AppConstants.token)}',
    },
  );

  Dio dio = Dio();

  Dio getInstance() {
    dio.interceptors.add(QueuedInterceptorsWrapper(onRequest: (options, handler) {
      options.headers["Authorization"] = 'Bearer ${StorageService.instance.fetch(AppConstants.token)}';
      //options.headers["Authorization"] = 'Bearer 17|bPsvkF3EGdeF7jNm95Uh5wMGyTps1quhaUhfQUdY455c8581';
      return handler.next(options);
    }));
    dio.options = options;
    return dio;
  }
}
