import 'dart:convert';
import 'dart:core';

TasksDTO tasksDTOFromJson(dynamic str) {
  final jsonData = json.decode(str);
  return TasksDTO.fromJson(jsonData);
}

String tasksDTOToJson(TasksDTO data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class TasksDTO {
  List<Task>? tasks;

  TasksDTO({
    required this.tasks,
  });

  factory TasksDTO.fromJson(Map<String, dynamic> json) => TasksDTO(
    tasks: json["tasks"] == null
        ? null
        : List<Task>.from(json["tasks"].map((x) => Task.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "tasks": tasks == null
        ? null
        : List<dynamic>.from(tasks!.map((x) => x.toJson())),
  };
}

class LoginApiResponse {
  String token;

  LoginApiResponse({required this.token});
}

class Task {
  String id;
  String gardenId;
  String startDate;
  String endDate;
  String empId;
  String empCount;
  String techOperId;
  String budget;
  String comment;
  String type;
  String factStartDate;
  String factEndDate;
  String factEmpCount;
  String factBudget;
  String status;
  String orderNumb;
  String createdEmpId;
  String statusReturned;
  String empName;
  String createdEmpName;

  Task(
      {required this.id,
        required this.gardenId,
        required this.startDate,
        required this.endDate,
        required this.empId,
        required this.empCount,
        required this.techOperId,
        required this.budget,
        required this.comment,
        required this.type,
        required this.factStartDate,
        required this.factEndDate,
        required this.factEmpCount,
        required this.factBudget,
        required this.status,
        required this.orderNumb,
        required this.createdEmpId,
        required this.statusReturned,
        required this.empName,
        required this.createdEmpName});

  factory Task.fromJson(Map<String, dynamic> map) => Task(
    id: map["id"],
    gardenId: map["gardenId"],
    startDate: map["startDate"],
    endDate: map["endDate"],
    empId: map["empId"],
    empCount: map["empCount"],
    techOperId: map["techOperId"],
    budget: map["budget"],
    comment: map["comment"],
    type: map["type"],
    factStartDate: map["factStartDate"],
    factEndDate: map["factEndDate"],
    factEmpCount: map["factEmpCount"],
    factBudget: map["factBudget"],
    status: map["status"],
    orderNumb: map["orderNumb"],
    createdEmpId: map["createdEmpId"],
    statusReturned: map["statusReturned"],
    empName: map["empName"],
    createdEmpName: map["createdEmpName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "gardenId": gardenId,
    "startDate": startDate,
    "endDate": endDate,
    "empId": empId,
    "empCount": empCount,
    "techOperId": techOperId,
    "budget": budget,
    "comment": comment,
    "status": status,
    "type": type,
    "factStartDate": factStartDate,
    "factEndDate": factEndDate,
    "factEmpCount": factEmpCount,
    "factBudget": factBudget,
    "status": status,
    "orderNumb": orderNumb,
    "createdEmpId": createdEmpId,
    "statusReturned": statusReturned,
    "empName": empName,
    "createdEmpName": createdEmpName,
  };
}

