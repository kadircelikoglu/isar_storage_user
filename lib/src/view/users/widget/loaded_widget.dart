import 'package:flutter/material.dart';
import 'package:user_details/src/core/base/models/user/user_model.dart';
import 'package:user_details/src/view/users/widget/user_item.dart';

class LoadedWidget extends StatelessWidget {
  final List<UserModel> users;
  const LoadedWidget({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemCount: users.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return UserItem(
          userModel: users[index],
          index: index,
        );
      },
    );
  }
}
