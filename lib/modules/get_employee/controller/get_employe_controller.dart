import 'dart:convert';

import 'package:get/get.dart';
import 'package:lms/appConfig.dart';
import 'package:lms/models/emoloyee_model.dart';
import 'package:http/http.dart' as http;

class GetEmployeeController extends GetxController {
  RxList<Employee> employeeList = <Employee>[].obs;
  RxInt count = 0.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getEmploye();
  }

  void getEmploye() async {
    try {
      isLoading.value = true;
      final url = Uri.parse('${AppConfig.rootUrl}/employe');
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        /**
         * Decoding response body in json format to list of employee
         */

        final body = json.decode(response.body);
        count.value = body['count'];
        body['user'].forEach((element) {
          employeeList.add(Employee.fromJson(element));
        });
        employeeList.refresh();
        isLoading.value = false;
      } else {
        print(response.body);
        // print('sss');
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
    }
  }
}
