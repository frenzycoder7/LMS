import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lms/appConfig.dart';

class CreateEmployeeController extends GetxController {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController empidcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController probationcontroller = TextEditingController();
  Rx<DateTime> joiningDate = DateTime.now().obs;
  RxBool isCreating = false.obs;

  datetimepicker({required BuildContext context}) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: joiningDate.value,
      firstDate: DateTime(1997),
      lastDate: DateTime(2025),
    );

    if (date != null) {
      joiningDate.value = date;
    } else {}
  }

  void createEmployee() async {
    if (namecontroller.text.isEmpty ||
        empidcontroller.text.isEmpty ||
        emailcontroller.text.isEmpty ||
        probationcontroller.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please Enter Valid Details');
    } else {
      isCreating.value = true;
      Map<String, dynamic> body = {
        'name': namecontroller.text,
        'email': emailcontroller.text,
        'empId': empidcontroller.text,
        'dateOfJoining': joiningDate.value.millisecondsSinceEpoch.toString(),
        'probabtionPeriod': probationcontroller.text,
      };
      print(body);
      // Timer(Duration(seconds: 5), () {
      //   isCreating.value = false;
      // });
      try {
        final url=Uri.parse('${AppConfig.rootUrl}/employe');
        http.Response response= await http.post(url, body: body);
        print(response.statusCode);
        if(response.statusCode!=201){
          isCreating.value=false;
          Fluttertoast.showToast(msg: 'Server Error');
        }else{
          namecontroller.clear();
          emailcontroller.clear();
          empidcontroller.clear();
          probationcontroller.clear();
          joiningDate.value=DateTime.now();
          isCreating.value=false;
          Fluttertoast.showToast(msg: 'Employee Created');
        }

      } catch (e) {
        isCreating.value=false;
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }
}
