import 'dart:convert';



TokenResponseModel tokenResponseModelFromJson(String str) => TokenResponseModel.fromJson(json.decode(str));

String tokenResponseModelToJson(TokenResponseModel data) => json.encode(data.toJson());

class TokenResponseModel {
    TokenResponseModel({
         this.message,
         this.result,
    });

    String? message;
    Result? result;

    factory TokenResponseModel.fromJson(Map<String, dynamic> json) => TokenResponseModel(
        message: json["message"],
        result: Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "result": result?.toJson(),
    };
}

class Result {
    Result({
        required this.token,
        required this.userVerified,
    });

    String token;
    bool userVerified;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        token: json["token"],
        userVerified: json["user_verified"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "user_verified": userVerified,
    };
}
