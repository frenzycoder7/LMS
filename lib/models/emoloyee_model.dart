class Employee {
  String? sId;
  String? name;
  String? email;
  String? empId;
  int? dateOfJoining;
  bool? inProbabtion;
  int? probabtionEnd;
  int? probabtionPeriod;
  String? createdAt;

  Employee(
      {this.sId,
      this.name,
      this.email,
      this.empId,
      this.dateOfJoining,
      this.inProbabtion,
      this.probabtionEnd,
      this.probabtionPeriod,
      this.createdAt});

  Employee.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    empId = json['empId'];
    dateOfJoining = json['dateOfJoining'];
    inProbabtion = json['inProbabtion'];
    probabtionEnd = json['probabtionEnd'];
    probabtionPeriod = json['probabtionPeriod'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['empId'] = empId;
    data['dateOfJoining'] = dateOfJoining;
    data['inProbabtion'] = inProbabtion;
    data['probabtionEnd'] = probabtionEnd;
    data['probabtionPeriod'] = probabtionPeriod;
    data['createdAt'] = createdAt;
    return data;
  }
}
