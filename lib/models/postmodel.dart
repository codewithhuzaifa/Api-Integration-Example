class Postmodel {
  int? userId;
  int? id;
  String? title;
  String? body;

  Postmodel({this.userId, this.id, this.title, this.body});

  Postmodel.fromJson(Map<dynamic, dynamic> json) {
    userId = json["userId"];
    id = json["id"];
    title = json["title"];
    body = json["body"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["userId"] = userId;
    _data["id"] = id;
    _data["title"] = title;
    _data["body"] = body;
    return _data;
  }
}
