import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainPopup {
  Future<dynamic> mainPopup(
    BuildContext context, {
    double height = 50,
    double padding = 0,
    double width = 90,
    required Widget child,
  }) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: false,
      pageBuilder: (context, animation, secondaryAnimation) {
        return ScaleTransition(
          scale: Tween<double>(begin: .5, end: 1).animate(animation),
          child: Padding(
            padding: EdgeInsets.only(bottom: padding.h),
            child: AlertDialog(
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              content: SizedBox(
                height: height.h,
                width: width.w,
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}
