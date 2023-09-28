import 'dart:convert';

import 'package:newsline_app/common/modal/user_modal.dart';

News newsFromJson(String str) => News.fromJson(json.decode(str));

String newsToJson(News data) => json.encode(data.toJson());

class News {
    String? id;
    String? cover;
    String? title;
    DateTime? creation;
    int? status;
    int? visitsNum;
    int? reviewNum;
    String? author;
    User? authorInfo;

    News({
        this.id,
        this.cover,
        this.title,
        this.creation,
        this.status,
        this.visitsNum,
        this.reviewNum,
        this.author,
        this.authorInfo
    });

    factory News.fromJson(Map<String, dynamic> json) => News(
        id: json["id"] ?? 'Unknown',
        cover: json["cover"] ?? 'Unknown',
        title: json["title"] ?? 'Unknown',
        creation: json["creation"] == null ? null : DateTime.parse(json["creation"]),
        status: json["status"] ?? 'Unknown',
        visitsNum: json["visitsNum"] ?? 'Unknown',
        reviewNum: json["reviewNum"] ?? 'Unknown',
        author: json["author"] ?? 'Unknown',
        authorInfo: json["authorInfo"] == null ? User() : User.fromJson(json["authorInfo"])
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "cover": cover,
        "title": title,
        "creation": creation?.toIso8601String(),
        "status": status,
        "visitsNum": visitsNum,
        "reviewNum": reviewNum,
        "author": author,
        "authorInfo": authorInfo
    };
}