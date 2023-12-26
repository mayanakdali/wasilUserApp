import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasil/shared/utils/ui/user_text.dart';

import '../../constant/colors.dart';


class CommonViews {
  static final CommonViews _shared = CommonViews._private();

  factory CommonViews() => _shared;

  CommonViews._private();

  // singleton Ready

  AppBar getAppBar(
      {String? title, Color? color, IconData? icon, Widget? action}) {
    return AppBar(
        actions: [
          //
          Padding(padding: const EdgeInsets.only(right: 20), child: action)
        ],
        backgroundColor: color ?? Colors.white,
        elevation: 0,
        // shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
        title: UserText(
          title: title ?? '',
        ),
        centerTitle: true);
  }

  Widget createButton(
      {required String title, required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              minimumSize: Size(MediaQuery.sizeOf(Get.context!).width, 55),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
          child: UserText(
            title: title,
            textColor: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          )),
    );
  }
}
