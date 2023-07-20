import 'package:flutter/material.dart';
import 'package:user_details/src/core/constants/app/string_constants.dart';
import 'package:user_details/src/view/users/provider/user_provider.dart';

class CustomTextField extends StatelessWidget {
  final UserProvider userProvider;
  const CustomTextField({super.key, required this.userProvider});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        userProvider.filterSearch(value);
      },
      controller: userProvider.controller,
      decoration: InputDecoration(
          labelText: StringConstants.search,
          hintText: StringConstants.search,
          prefixIcon: Icon(Icons.search),
          suffix: InkWell(
              onTap: () {
                userProvider.resetFilter();
                userProvider.controller.clear();
              },
              child: Icon(Icons.close)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)))),
    );
  }
}
