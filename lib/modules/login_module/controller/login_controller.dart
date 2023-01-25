import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lms/appConfig.dart';
import 'package:lms/data_controller.dart';
import 'package:lms/models/admin_models.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late DataController dataController;
  RxBool isLoading = true.obs;
  RxBool showPassword = true.obs;
  RxBool isLoggingIn = false.obs;

  void showhidePassword() {
    showPassword.value = !showPassword.value;
  }

  void performLogin() async {
    try {
      await validateForm();
      isLoggingIn.value = true;
      final url = Uri.parse('${AppConfig.rootUrl}/admin/login');
      http.Response response = await http.post(url, body: {
        'email': emailController.text,
        'password': passwordController.text,
      });
      print(response.body);
      if (response.statusCode != 200) {
        isLoggingIn.value = false;
        Fluttertoast.showToast(msg: 'Invalid Credentials');
        throw Exception('Invalid Credentials');
      } else {
        Fluttertoast.showToast(msg: 'Login Success');
        final data = json.decode(response.body);
        await dataController.setToken(token: data['token']);
        dataController.setProfile(
          adminModel: AdminModel.fromJson(data['admin']),
        );
        Get.offAllNamed('/home');
      }
    } catch (e) {
      isLoggingIn.value = false;
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future<bool> validateForm() async {
    if (emailController.text.isEmpty || !emailController.text.isEmail) {
      throw Exception('Please Enter Valid Email');
    } else if (passwordController.text.isEmpty) {
      throw Exception('Please Enter Valid Password');
    } else {
      return true;
    }
  }

  @override
  void onInit() {
    dataController = Get.find<DataController>();
    validateToken();
    super.onInit();
  }

  validateToken() async {
    String? token = await dataController.getToken();
    if (token == null || token == "?") {
      isLoading.value = false;
    } else {
      try {
        final url = Uri.parse('${AppConfig.rootUrl}/admin/profile');
        http.Response response = await http.post(url, body: {
          'token': token,
        });
        if (response.statusCode != 200) {
          Fluttertoast.showToast(msg: json.decode(response.body)['message']);
          isLoading.value = false;
        } else {
          final data = json.decode(response.body);
          await dataController.setToken(token: data['token']);
          dataController.setProfile(
            adminModel: AdminModel.fromJson(data['admin']),
          );
          Get.offAllNamed('/home');
        }
      } catch (e) {
        isLoading.value = false;
      }
    }
  }
}
