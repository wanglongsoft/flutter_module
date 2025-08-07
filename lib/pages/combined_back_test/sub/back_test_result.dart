import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'back_test_result_controller.dart';

class BackTestResult extends GetView<BackTestResultController> {
  const BackTestResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(controller.title, style: TextStyle(color: Colors.redAccent),),
      ],
    );
  }
}
