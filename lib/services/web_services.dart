import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
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
    var response = await dio.post(verifyPhone, data: {
      "phone": "22222222222",
    });
    log('response :: $response');
    //SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    //sharedprefs.setString('customToken',response.data['token']);

    return response;
  }

  getIdToken({required String customToken}) async {
    var idToken = await dio.post(signInCustomToken,
        data: {"token": customToken, "returnSecureToken": true});

    log('idToken :: $idToken');
    return idToken;
  }

  Future<DataModel> getAnnouncementList({required authorizationToken}) async {
    dio_response.Response announcementResponse = await dio.get(
      announcementList,
      options: Options(headers: {
        'Authorization': authorizationToken,
      }),
    );

    if (announcementResponse.statusCode == 200) {
      DataModel dataModelDummy = DataModel.fromJson(announcementResponse.data);
      log(dataModelDummy.toString());
      return dataModelDummy;
    } else {
      throw Exception('Failed to load data');
    }

    // final lastResponseJson = jsonDecode(lastResponse.data);

    // return DataModel.fromJson( lastResponseJson);
  }
}
