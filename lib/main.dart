import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module/pages/combined_back_test/binding.dart';
import 'package:flutter_module/pages/combined_back_test/view.dart';
import 'package:flutter_module/pages/fragment/fragment_binding.dart';
import 'package:flutter_module/pages/fragment/fragment_page.dart';
import 'package:flutter_module/pages/test/test_binding.dart';
import 'package:flutter_module/pages/test/test_page.dart';
import 'package:flutter_module/pages/video/video_page.dart';
import 'package:flutter_module/utils/network_capture/view/network_capture_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_module/resource/assets.gen.dart';
import 'package:flutter_module/utils/native_channel.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

@pragma('vm:entry-point')
void mainFragment() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyFragmentApp());
}

class MyApp extends StatelessWidget {
  final navGK = GlobalKey<NavigatorState>();

  MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NetworkCaptureApp(
      navigatorKey: navGK,
      enable: false,
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(750, 1666),
        builder: (context, child) {
          return GetMaterialApp(
            navigatorKey: navGK,
            initialRoute: '/home',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0,
              ),
            ),
            getPages: [
              GetPage(
                name: '/home',
                page: () => const MyHomePage(title: "Flutter Demo Page"),
              ),
              GetPage(
                name: '/video',
                page: () => const VideoPage(),
              ),
              GetPage(
                name: '/test',
                page: () => const TestPage(),
                binding: TestBinding(),
                transition: Transition.rightToLeft,
                transitionDuration: const Duration(milliseconds: 100),
              ),
              GetPage(
                name: '/portfolioBackTest',
                binding: PortfolioBackTestBinding(),
                page: () => const CombinedBackTest(),
              ),
            ],
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    debugPrint("appBottomIcon.path: ${Assets.images.appBottomIcon.path}");
    super.initState();
    NativeUtil.instance.method.setMethodCallHandler((call) async {
      debugPrint("call.method........: ${call.method}");
    });
    NativeUtil.instance.message.setMessageHandler((String? message) async {
      debugPrint('Received message from native: $message');
      return '$message';
    });
  }

  void toFlutterScreen() {
    NativeUtil.instance.method.invokeMethod<void>("toFlutterScreen", 10);
  }

  @override
  Widget build(BuildContext context) {
    double appBarHeight = AppBar().preferredSize.height;
    debugPrint("appBarHeight: $appBarHeight");
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Get.toNamed("/test");
              },
              child: Assets.images.appIcon.image(width: 200),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // 四舍五入法保留两位小数
  static String roundUpDigitsDecimal(double num, int digits) {
    String value = num.toString();
    if (value.isEmpty) {
      return "";
    } else {
      int index = value.indexOf(".");
      if (value.length - index > (digits + 1)) {
        if (value[index + digits + 1] == "5" ||
            value[index + digits + 1] == "6" ||
            value[index + digits + 1] == "7" ||
            value[index + digits + 1] == "8" ||
            value[index + digits + 1] == "9") {
          double result = double.parse(value.substring(0, index + digits + 1));
          return num >= 0
              ? (result + 1 / pow(10, digits)).toStringAsFixed(digits)
              : (result - 1 / pow(10, digits)).toStringAsFixed(digits);
        } else {
          return value.substring(0, index + digits + (digits == 0 ? 0 : 1));
        }
      } else if (value.length - index < (digits + 1)) {
        //digits位小数，末位补0
        return "$value${'0' * (digits - (value.length - index - 1))}";
      } else {
        //digits位小数，不处理
        return value;
      }
    }
  }

  @override
  void dispose() {
    NativeUtil.instance.method.setMethodCallHandler(null);
    NativeUtil.instance.message.setMessageHandler(null);
    super.dispose();
  }
}

class MyFragmentApp extends StatelessWidget {
  const MyFragmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.android) {
      // android 平台
      SystemUiOverlayStyle style =
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(style);
    }

    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(750, 1624),
      builder: (context, child) {
        return GetMaterialApp(
          initialRoute: '/fragment',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
          ),
          getPages: [
            GetPage(
              name: '/fragment',
              page: () => const FragmentPage(),
              binding: FragmentBinding(),
            ),
          ],
        );
      },
    );
  }
}
