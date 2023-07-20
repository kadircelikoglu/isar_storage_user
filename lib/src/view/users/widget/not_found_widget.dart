import 'package:flutter/material.dart';
import 'package:user_details/src/core/components/text/custom_text.dart';
import 'package:user_details/src/core/constants/app/string_constants.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CustomText(
      StringConstants.userNotFound,
      textStyle: TextStyle(color: Colors.black),
    ));
  }
}
