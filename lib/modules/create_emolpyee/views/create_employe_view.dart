import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lms/modules/create_emolpyee/controller/create_employee_controller.dart';
import 'package:lms/modules/create_emolpyee/views/heroInput.dart';

class CreateEmployeeView extends GetView<CreateEmployeeController> {
  const CreateEmployeeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Create Employee',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Obx(
          () {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                HeroInput(
                  name: 'Employee Name',
                  controller: controller.namecontroller,

                  enabled: !controller.isCreating.value,
                  hintText: 'Enter Employee Name',
                ),
                HeroInput(
                  name: 'Employee Id',
                  controller: controller.empidcontroller,
                  enabled: !controller.isCreating.value,
                  hintText: 'Enter Employee Id',
                ),
                HeroInput(
                  name: 'Email',
                  controller: controller.emailcontroller,
                  enabled: !controller.isCreating.value,
                  hintText: 'Enter Email',
                ),

                HeroInput(
                  name: 'Probation Period',
                  controller: controller.probationcontroller,
                  enabled: !controller.isCreating.value,
                  hintText: 'Enter Probation Period',
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Material(
                      elevation: 2,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        color: Theme.of(context).bottomAppBarColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: const Text(
                                'Select Date Of Joining',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            Obx(
                              () {
                                return InkWell(
                                  onTap: () {
                                    controller.datetimepicker(context: context);
                                  },
                                  child: Container(
                                    height: 50,
                                    width: double.infinity,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      controller.joiningDate
                                          .toString()
                                          .split(' ')
                                          .first,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      )),
                ),

                // ElevatedButton(onPressed: () {}, child: Text('CREATE'))
                controller.isCreating.isTrue
                    ? const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ElevatedButton.icon(
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                              const Size(double.infinity, 50),
                            ),
                          ),
                          onPressed: () {
                            controller.createEmployee();
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "CREATE",
                          ),
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
