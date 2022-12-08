import 'dart:convert';

CustomTokenModel customTokenModelFromJson(String str) => CustomTokenModel.fromJson(json.decode(str));

String customTokenModelToJson(CustomTokenModel data) => json.encode(data.toJson());

class CustomTokenModel {
    CustomTokenModel({
        required this.kind,
        required this.idToken,
        required this.refreshToken,
        required this.expiresIn,
        required this.isNewUser,
    });

    String kind;
    String idToken;
    String refreshToken;
    String expiresIn;
    bool isNewUser;

    factory CustomTokenModel.fromJson(Map<String, dynamic> json) => CustomTokenModel(
        kind: json["kind"],
        idToken: json["idToken"],
        refreshToken: json["refreshToken"],
        expiresIn: json["expiresIn"],
        isNewUser: json["isNewUser"],
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "idToken": idToken,
        "refreshToken": refreshToken,
        "expiresIn": expiresIn,
        "isNewUser": isNewUser,
    };
}
