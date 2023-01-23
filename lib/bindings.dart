import 'package:get/get.dart';
import 'package:lms/modules/create_emolpyee/controller/create_employee_controller.dart';
import 'package:lms/modules/get_employee/controller/get_employe_controller.dart';
import 'package:lms/modules/home/controller/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}

class GetEmoloyeeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(GetEmployeeController());
  }
}
class CreateEmployeeBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(CreateEmployeeController());
  }

}