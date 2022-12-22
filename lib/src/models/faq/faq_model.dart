class FaqModel {
  FaqModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.category,
    this.title,
    this.body,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? category;
  String? title;
  String? body;

  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
        id: json["ID"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        category: json["category"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "category": category,
        "title": title,
        "body": body,
      };
}
