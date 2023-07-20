import 'package:flutter/material.dart';
import 'package:user_details/src/core/constants/app/string_constants.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<AppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: Text(StringConstants.filterUser,
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.greenAccent);
  }
}
