class AdminModel {
  String? sId;
  String? name;
  String? email;
  String? createdAt;

  AdminModel({this.sId, this.name, this.email, this.createdAt});

  AdminModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['createdAt'] = createdAt;
    return data;
  }
}
