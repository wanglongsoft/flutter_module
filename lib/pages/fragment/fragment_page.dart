import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'fragment_controller.dart';

class FragmentPage extends GetView<FragmentController> {
  const FragmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Listener(
              onPointerMove: (event) {
                controller.onPointerMove(event);
              },
              onPointerUp: (event) {
                controller.onPointerUp(event);
              },
              child: ListView.builder(
                controller: controller.scrollController,
                padding: EdgeInsets.zero,
                itemBuilder: (ctx, index) {
                  if (index == 0) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 20.w),
                      width: 750.w,
                      height: 300.w,
                      color: Colors.redAccent,
                      alignment: Alignment.center,
                      child: Text(
                        controller.title,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  } else {
                    return Container(
                      margin: EdgeInsets.only(bottom: 20.w),
                      width: 750.w,
                      height: 300.w,
                      color: Colors.redAccent,
                    );
                  }
                },
                itemCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
