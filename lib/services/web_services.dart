import 'package:dio/dio.dart';


class WebAPIService {
  static final WebAPIService _instance = WebAPIService._initialise();
  WebAPIService._initialise()
      : _dio = Dio(BaseOptions(
          baseUrl:"https//:be.monsuke.jp:444/",
          // connectTimeout: 5000,
          // receiveTimeout: 3000,
        ))
          ..interceptors.add(LogInterceptor(
              responseBody: true,
              requestBody: true,
              requestHeader: true,
              request: true));
  factory WebAPIService() => _instance;
  final Dio _dio;
  Dio get dio => _dio;
  getToken (){
    
  }
}