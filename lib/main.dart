import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:user_details/src/core/init/locator.dart';
import 'package:user_details/src/core/init/provider_singleton.dart';
import 'package:user_details/src/view/users/users_view.dart';

void main() async {
  await _init();
  runApp(MultiProvider(
      providers: ProviderSingleton.instance.otherProviders,
      child: const MyApp()));
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  EquatableConfig.stringify = true;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const UsersView(),
      );
    });
  }
}
