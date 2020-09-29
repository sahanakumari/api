class postfeed{
  int userId;
  int id;
  String _title;

  String get title => _title;
  String body;



  postfeed({this.userId, this.id, this.body});

  postfeed.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    _title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this._title;
    data['body'] = this.body;
    return data;
  }
}