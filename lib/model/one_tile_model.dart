class AnnouncementModel {
  AnnouncementModel({
    this.message,
    this.result,
  });

  String? message;
  Result? result;

  factory AnnouncementModel.fromJson(Map<String, dynamic> json) =>
      AnnouncementModel(
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
    this.count,
    this.data,
  });

  int? count;
  List<Announcement>? data;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        count: json["count"],
        data: List<Announcement>.from(
            json["data"].map((x) => Announcement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Announcement {
  Announcement({
    this.isViewed,
    this.id,
    this.viewerType,
    this.subject,
    this.notice,
    this.photoList,
    this.createdBy,
    this.created,
  });

  bool? isViewed;
  String? id;
  String? viewerType;
  String? subject;
  String? notice;
  List<dynamic>? photoList;
  CreatedBy? createdBy;
  DateTime? created;

  factory Announcement.fromJson(Map<String, dynamic> json) => Announcement(
        isViewed: json["isViewed"],
        id: json["_id"],
        viewerType: json["viewerType"],
        subject: json["subject"],
        notice: json["notice"],
        photoList: List<dynamic>.from(json["photoList"].map((x) => x)),
        createdBy: CreatedBy.fromJson(json["createdBy"]),
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "isViewed": isViewed,
        "_id": id,
        "viewerType": viewerType,
        "subject": subject,
        "notice": notice,
        "photoList": List<dynamic>.from((photoList ?? []).map((x) => x)),
        "createdBy": createdBy?.toJson(),
        "created": created?.toIso8601String(),
      };
}

class CreatedBy {
  CreatedBy({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.role,
    this.photoList,
    this.created,
    this.updated,
    this.createdAt,
  });

  String? id;
  String? name;
  String? email;
  String? phone;
  String? role;
  List<dynamic>? photoList;
  DateTime? created;
  DateTime? updated;
  DateTime? createdAt;

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        role: json["role"],
        photoList: List<dynamic>.from(json["photoList"].map((x) => x)),
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "role": role,
        "photoList": List<dynamic>.from((photoList ?? []).map((x) => x)),
        "created": created?.toIso8601String(),
        "updated": updated?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
      };
}
