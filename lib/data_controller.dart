import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lms/models/admin_models.dart';

class DataController extends GetxController {
  Rx<AdminModel> adminModel = AdminModel().obs;
  RxString token = ''.obs;
  GetStorage storage = GetStorage();

  setToken({required String token}) async {
    this.token.value = token;
    await storage.write('token', token);
  }

  Future<String?> getToken() async {
    return await storage.read('token') ?? "?";
  }

  setProfile({required AdminModel adminModel}) {
    this.adminModel.value = adminModel;
  }
}
