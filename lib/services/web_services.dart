import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:task_four/model/custom_token_model.dart';
import 'package:task_four/model/token_response_model.dart';
import 'package:task_four/utils/url.dart';
import '../model/one_tile_model.dart';
import 'package:dio/dio.dart' as dio_response;

class WebAPIService {
  static final WebAPIService _instance = WebAPIService._initialise();
  WebAPIService._initialise()
      : _dio = Dio(BaseOptions(
          baseUrl: "https//:be.monsuke.jp:444/",
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

  /// API CALL TO GET TOKEN FROM BACKEND
  getToken() async {
    Map data ={
       "phone": "22222222222"
    };
    var response = await dio.post(verifyPhone, 
    data: data
     );
    var tokenResponse=TokenResponseModel.fromJson(response.data);
    return tokenResponse;
  }

  getIdToken({required String customToken}) async {
    Map data ={"token": customToken, "returnSecureToken": true};
    var idToken = await dio.post(signInCustomToken,
    data: data
    );

    log('idToken :: $idToken');
    var customResponse=CustomTokenModel.fromJson(idToken.data);
    return customResponse;
  }

  Future<AnnouncementModel> getAnnouncementList(
      {required authorizationToken}) async {
        Map<String,dynamic> header={'Authorization': authorizationToken};
    dio_response.Response announcementResponse = await dio.get(
      announcementList,
      options: Options(headers: header
        
      ),
    );

    if (announcementResponse.statusCode == 200) {
      AnnouncementModel dataModelDummy =
          AnnouncementModel.fromJson(announcementResponse.data);
      log(dataModelDummy.toString());
      return dataModelDummy;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
