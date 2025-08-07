import 'package:flutter/material.dart';
import 'package:flutter_module/pages/model/constant.dart';
import 'package:flutter_module/pages/test/test_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/no_glow_scroll_behavior.dart';

class TestPage extends GetView<TestController> {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title),
      ),
      body: ScrollConfiguration(
        behavior: NoGlowScrollBehavior(),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 750.w,
                  height: 55.w,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: controller.horizontalTitle,
                    child: Row(
                      children: [
                        ...tableColumns.map(
                          (data) => Container(
                            width: data.width.w,
                            height: 55.w,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                top: BorderSide(color: Colors.black),
                                bottom: BorderSide(color: Colors.black),
                                right: BorderSide(color: Colors.black),
                              ),
                            ),
                            child: Text(data.title),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: tableColumns[0].width.w,
                  height: 55.w,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Colors.black),
                      bottom: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                    ),
                  ),
                  child: Text(tableColumns[0].title),
                ),
              ],
            ),
            Stack(
              children: [
                SizedBox(
                  width: 750.w,
                  height: getTableHeight(context),
                ),
                SizedBox(
                  width: 750.w,
                  height: getTableHeight(context),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: controller.horizontalData,
                    child: SizedBox(
                      width: controller.screenWidth.w,
                      height: getTableHeight(context),
                      child: ListView.builder(
                        controller: controller.verticalData,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              ...tableColumns.asMap().keys.map((key) =>
                                  Container(
                                    width: tableColumns[key].width.w,
                                    height: 55.w,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                        bottom: BorderSide(color: Colors.black),
                                        right: BorderSide(color: Colors.black),
                                      ),
                                    ),
                                    child: Text("$key $index"),
                                  )),
                            ],
                          );
                        },
                        itemCount: 100,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: tableColumns[0].width.w,
                  height: getTableHeight(context),
                  child: ListView.builder(
                    controller: controller.verticalTitle,
                    itemBuilder: (context, index) {
                      return Container(
                        width: tableColumns[0].width.w,
                        height: 55.w,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            bottom: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                          ),
                        ),
                        child: Text("name: ${index + 1}"),
                      );
                    },
                    itemCount: 100,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  double getTableHeight(BuildContext context) {
    return MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom -
        AppBar().preferredSize.height -
        55.w;
  }
}
