import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    String? id;
    String? code;
    String? portrait;
    String? nickName;
    String? email;
    String? phone;
    String? nation;
    DateTime? birthday;
    int? gender;
    int? role;
    int? official;
    int? following;
    String? brief;
    int? collectNum;
    int? followNum;
    int? bookmarkNum;

    User({
        this.id,
        this.code,
        this.portrait,
        this.nickName,
        this.email,
        this.phone,
        this.nation,
        this.birthday,
        this.gender = 0,
        this.role,
        this.official = 0,
        this.following = 0,
        this.brief,
        this.collectNum = 0,
        this.followNum,
        this.bookmarkNum = 0
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? 'Unknown',
        code: json["code"] ?? 'Unknown',
        portrait: json["portrait"] ?? 'Unknown',
        nickName: json["nickName"] ?? 'Unknown',
        email: json["email"] ?? 'Unknown',
        phone: json["phone"] ?? 'Unknown',
        nation: json["nation"] ?? 'Unknown',
        birthday: json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
        gender: json["gender"] ?? 0,
        role: json["role"] ?? 0,
        official: json["official"] ?? 0,
        following: json["following"] ?? 0,
        brief: json["brief"] ?? 'Unknown',
        collectNum: json["collectNum"] ?? 0,
        followNum: json["followNum"] ?? 0,
        bookmarkNum: json["bookmarkNum"] ?? 0,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "portrait": portrait,
        "nickName": nickName,
        "email": email,
        "phone": phone,
        "nation": nation,
        "birthday": birthday?.toIso8601String(),
        "gender": gender,
        "role": role,
        "official": official,
        "following": following,
        "brief": brief,
        "collectNum": collectNum,
        "followNum": followNum,
        "bookmarkNum": bookmarkNum
    };
}