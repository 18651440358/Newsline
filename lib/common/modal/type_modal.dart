import 'dart:convert';

NewsType typeFromJson(String str) => NewsType.fromJson(json.decode(str));

String typeToJson(NewsType data) => json.encode(data.toJson());

class NewsType {
    String? id;
    String? title;
    DateTime? creation;
    DateTime? latest;
    int? status;
    String? author;

    NewsType({
        this.id,
        this.title,
        this.creation,
        this.latest,
        this.status,
        this.author,
    });

    factory NewsType.fromJson(Map<String, dynamic> json) => NewsType(
        id: json["id"],
        title: json["title"],
        creation: json["creation"] == null ? null : DateTime.parse(json["creation"]),
        latest: json["latest"] == null ? null : DateTime.parse(json["latest"]),
        status: json["status"],
        author: json["author"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "creation": creation?.toIso8601String(),
        "latest": latest?.toIso8601String(),
        "status": status,
        "author": author,
    };
}