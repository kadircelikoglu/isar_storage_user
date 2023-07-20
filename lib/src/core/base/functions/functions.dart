import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_details/src/view/users/provider/user_provider.dart';

class Functions {
  static Functions? _instance;
  static Functions get instance {
    _instance ??= Functions._init();
    return _instance!;
  }

  Functions._init();

  Widget platformIndicator() {
    return const CircularProgressIndicator();
  }

  closePopup(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  UserProvider provider(BuildContext context) {
    return context.read<UserProvider>();
  }
}
