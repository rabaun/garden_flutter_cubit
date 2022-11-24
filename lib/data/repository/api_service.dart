import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  Dio dio = Dio();

  Future<String?> getToken() async {
    var login;

    var requestBody = json
        .encode({"method": "auth", "login": "svyatenko_a", "password": "111a"});
    var response = await dio.post(
        'http://185.229.9.228/ords/gardencore/gardeniot/v1/',
        data: requestBody);

    if (response.statusCode == 200) {
      try {
        login = json.decode(response.data['token']);
        print(login);
      } catch (e) {}
      return login.toString();
    } else {
      return login.toString();
    }
  }

  Future<dynamic?> getNewTasks(String token) async {
    var _tasksList;
    var requestBody = json.encode({"method": "getTasks"});
    var response =
        await Dio().post('http://185.229.9.228/ords/gardencore/gardeniot/v1/',
            data: requestBody,
            options: Options(
              headers: {"token": "$token"},
            ));
    if (response.statusCode == 200) {
      var data = response.data;
      print(data);
      for (int i = 0; i < data.length; i++) {
        try {
          var tasksList = await data['tasks'];
          _tasksList = tasksList;
        } catch (e) {
          if (kDebugMode) print(e);
        }
      }
    }
    print(_tasksList);
    return _tasksList;
  }

  Future<dynamic?> getTechOper(String token) async {
    var _techOperList;
    var requestBody = json.encode({"method": "getTechs"});
    var response =
        await Dio().post('http://185.229.9.228/ords/gardencore/gardeniot/v1/',
            data: requestBody,
            options: Options(
              headers: {"token": "$token"},
            ));
    if (response.statusCode == 200) {
      var data = response.data;
      print(data);
      for (int i = 0; i < data.length; i++) {
        try {
          var techOperList = await data['techOper'];
          _techOperList = techOperList;
        } catch (e) {
          if (kDebugMode) print(e);
        }
      }
    }
    print(_techOperList);
    return _techOperList;
  }
}
