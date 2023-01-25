import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/modules/login_module/controller/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      resizeToAvoidBottomInset: false,
      body: Obx(() {
        return controller.isLoading.isTrue
            ? Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'LOG',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'IN',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Theme.of(context).bottomAppBarColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Obx(() {
                        return TextField(
                          enabled: !controller.isLoggingIn.value,
                          controller: controller.emailController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Theme.of(context).bottomAppBarColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Obx(() {
                        return TextField(
                          controller: controller.passwordController,
                          enabled: !controller.isLoggingIn.value,
                          obscureText: controller.showPassword.value,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                            prefixIcon: const Icon(
                              Icons.password,
                              color: Colors.white,
                            ),
                            suffixIcon: InkWell(
                              onTap: controller.showhidePassword,
                              child: const Icon(Icons.remove_red_eye),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Obx(() {
                      return controller.isLoggingIn.isTrue
                          ? Container(
                              alignment: Alignment.center,
                              child: const CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blue),
                                minimumSize: MaterialStateProperty.all(
                                  const Size(double.infinity, 50),
                                ),
                              ),
                              onPressed: () {
                                controller.performLogin();
                              },
                              child: const Text('LOG IN'),
                            );
                    }),
                  ),
                ],
              );
      }),
    );
  }
}
