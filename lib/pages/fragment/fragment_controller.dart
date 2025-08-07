import 'package:flutter/material.dart';
import 'package:flutter_module/utils/native_channel.dart';
import 'package:get/get.dart';

class FragmentController extends GetxController {
  final String title = "Fragment";
  final ScrollController scrollController = ScrollController();
  double lastDy = -100;

  @override
  void onInit() {
    NativeUtil.instance.method.setMethodCallHandler((call) async {
      debugPrint("call.method........: ${call.method}");
    });
    NativeUtil.instance.message.setMessageHandler((String? message) async {
      debugPrint('Received message from native: $message');
      return '$message';
    });
    super.onInit();
  }

  @override
  void onClose() {
    NativeUtil.instance.method.setMethodCallHandler(null);
    NativeUtil.instance.message.setMessageHandler(null);
    scrollController.dispose();
    super.onClose();
  }

  void disallowIntercept(bool isMoveUp) {
    debugPrint("disallowIntercept isMoveUp: $isMoveUp");
    if (scrollController.position.pixels <= 0) {//顶部
      if(isMoveUp) {// 上滑需处理
        debugPrint("disallowIntercept isMoveUp top......................");
        // NativeUtil.instance.method.invokeMethod<void>("disallowIntercept", true);
      } else {
        // NativeUtil.instance.method.invokeMethod<void>("disallowIntercept", false);
      }
    } else if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent) {//底部
      if(isMoveUp) {
        // NativeUtil.instance.method.invokeMethod<void>("disallowIntercept", false);
      } else {// 下滑需处理
        debugPrint("disallowIntercept isMoveUp bottom......................");
        // NativeUtil.instance.method.invokeMethod<void>("disallowIntercept", true);
      }
    } else {// 上下滑需处理
      // NativeUtil.instance.method.invokeMethod<void>("disallowIntercept", true);
    }
  }

  void onPointerMove(PointerMoveEvent event) {
    debugPrint("onPointerMove ${event.position.dy}");
    if (lastDy == -100) {
      lastDy = event.position.dy;
      return;
    }
    if(event.position.dy - lastDy == 0) {
      return;
    }
    disallowIntercept(event.position.dy - lastDy < 0);
    lastDy = event.position.dy;
  }

  void onPointerUp(PointerUpEvent event) {
    debugPrint("disallowIntercept onPointerUp");
    lastDy = -100;
  }
}
