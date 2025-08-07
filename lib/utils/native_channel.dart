import 'package:flutter/services.dart';

class NativeUtil {
  factory NativeUtil() {
    return instance;
  }
  static NativeUtil instance = NativeUtil._();
  NativeUtil._();
  MethodChannel method = const MethodChannel('com.example.flutter_module/methodChannel');
  BasicMessageChannel<String> message = BasicMessageChannel<String>(
    'com.example.flutter_module/basicMessageChannel',
    StringCodec(),
  );

  // 发送消息
  Future<String?> sendMessage(String msg) async {
    return await message.send(msg);
  }
}