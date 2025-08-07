import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'network_capture/http/capture_dio_intercept.dart';

class DioUtil {
  factory DioUtil() => _instance ?? DioUtil._internal();
  static DioUtil instance = _instance ?? DioUtil._internal();
  static DioUtil? _instance;

  DioUtil._internal() {
    _instance = this;
    _instance!._init();
  }

  late Dio _dio;
  Dio get dio => _dio;

  void _init() {
    _dio = Dio();
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: true,
        filter: (options, args){
          // don't print requests with uris containing '/posts'
          if(options.path.contains('/posts1111')){
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        }
    ));
    _dio.interceptors.add(CaptureDioInterceptor());
  }
}