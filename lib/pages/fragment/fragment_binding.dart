import 'package:get/get.dart';
import 'fragment_controller.dart';

class FragmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FragmentController());
  }
}
