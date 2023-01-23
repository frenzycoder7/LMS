// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/modules/get_employee/controller/get_employe_controller.dart';

class GetEmployee extends GetView<GetEmployeeController> {
  const GetEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All Employee',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        actions: [
          Obx(() {
            return Container(
              margin: const EdgeInsets.only(right: 10),
              alignment: Alignment.center,
              child: controller.isLoading.isTrue
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 1,
                    )
                  : Text(
                      controller.count.value.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
            );
          })
        ],
      ),
      body: Obx(
        () {
          return controller.isLoading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : controller.employeeList.isEmpty
                  ? const Center(
                      child: Text(
                        'No Employee Found',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : ListView.builder(
                      itemCount: controller.employeeList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.employeeList[index].name ?? "N/A",
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              controller.employeeList[index].inProbabtion ==
                                      'true'
                                  ? const Text(
                                      'Probation',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text(
                                      'Permanent',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                            ],
                          ),
                          subtitle: Text(
                            'EmpId: ${controller.employeeList[index].empId.toString()}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    );
        },
      ),
    );
  }
}
