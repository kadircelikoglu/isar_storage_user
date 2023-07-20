import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_details/src/view/users/provider/user_provider.dart';

class ProviderSingleton {
  static ProviderSingleton? _instance;

  static ProviderSingleton get instance {
    _instance ??= ProviderSingleton._init();
    return _instance!;
  }

  ProviderSingleton._init() {}
  List<ChangeNotifierProvider<ChangeNotifier>> get otherProviders => [
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider()),
      ];
}
