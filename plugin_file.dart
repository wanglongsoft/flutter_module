import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('请提供一个文件名前缀作为参数');
    return;
  }

  final prefix = arguments[0];
  final currentDir = Directory.current;

  // 生成Page文件
  final pageFile = File('${currentDir.path}/${prefix}_page.dart');
  pageFile.writeAsStringSync('''
import 'package:flutter/material.dart';
import '${prefix}_controller.dart';
import 'package:get/get.dart';

class ${_toPascalCase(prefix)}Page extends GetView<${_toPascalCase(prefix)}Controller> {
  const ${_toPascalCase(prefix)}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('${_toPascalCase(prefix)} Page'),
      ),
    );
  }
}
''');

  // 生成Controller文件
  final controllerFile = File('${currentDir.path}/${prefix}_controller.dart');
  controllerFile.writeAsStringSync('''
import 'package:get/get.dart';

class ${_toPascalCase(prefix)}Controller extends GetxController {
  // 控制器逻辑
}
''');

  // 生成Binding文件
  final bindingFile = File('${currentDir.path}/${prefix}_binding.dart');
  bindingFile.writeAsStringSync('''
import 'package:get/get.dart';
import '${prefix}_controller.dart';

class ${_toPascalCase(prefix)}Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ${_toPascalCase(prefix)}Controller());
  }
}
''');

  print('已生成以下文件:');
  print('- ${prefix}_page.dart');
  print('- ${prefix}_controller.dart');
  print('- ${prefix}_binding.dart');
}

String _toPascalCase(String input) {
  if (input.isEmpty) return input;
  return input[0].toUpperCase() + input.substring(1);
}
