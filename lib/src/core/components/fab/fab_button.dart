import 'package:flutter/material.dart';
import 'package:user_details/src/core/components/text/custom_text.dart';
import 'package:user_details/src/core/constants/app/string_constants.dart';
import 'package:user_details/src/view/users/provider/user_provider.dart';

class FabButton extends StatelessWidget {
  final UserProvider userProvider;
  const FabButton({super.key, required this.userProvider});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        userProvider.resetFilter();
        userProvider.controller.clear();
      },
      child: Center(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                  child: CustomText(
                StringConstants.reset,
              )))),
    );
  }
}
