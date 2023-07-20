import 'package:flutter/material.dart';
import 'package:user_details/src/view/users/provider/user_provider.dart';
import 'package:user_details/src/view/users/widget/user_item.dart';

class InitialWidget extends StatelessWidget {
  final UserProvider provider;
  const InitialWidget({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemCount: provider.cloneUsers.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return UserItem(
          userModel: provider.cloneUsers[index],
          index: index,
        );
      },
    );
  }
}
