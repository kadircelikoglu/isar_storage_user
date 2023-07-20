import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_details/src/core/base/models/user/user_model.dart';
import 'package:user_details/src/core/base/popup/main/main_popup.dart';
import 'package:user_details/src/core/components/text/custom_text.dart';
import 'package:user_details/src/core/constants/app/string_constants.dart';
import 'package:user_details/src/core/extensions/base_extensions.dart';

import '../functions/functions.dart';

userPopup(BuildContext context, UserModel userModel, String profileImage) {
  return MainPopup().mainPopup(
    context,
    height: 45,
    width: 80,
    child: Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () => Functions.instance.closePopup(context),
            icon: const Icon(Icons.close),
          ),
        ),
        Center(
            child: CircleAvatar(
          backgroundImage: NetworkImage(profileImage),
          maxRadius: 6.h,
        )),
        5.h.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(StringConstants.name),
            CustomText(userModel.name ?? ''),
          ],
        ),
        1.h.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(StringConstants.email),
            CustomText(userModel.email ?? ''),
          ],
        ),
        1.h.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(StringConstants.phone),
            CustomText(userModel.phone ?? ''),
          ],
        ),
        1.h.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(StringConstants.website),
            CustomText(userModel.website ?? ''),
          ],
        ),
      ],
    ),
  );
}
