import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'combined_diagnosis_controller.dart';

class CombinedDiagnosis extends GetView<CombinedDiagnosisController> {
  const CombinedDiagnosis({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(controller.title, style: TextStyle(color: Colors.redAccent),),
      ],
    );
  }
}
