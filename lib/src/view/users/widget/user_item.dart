import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_details/src/core/base/functions/functions.dart';
import 'package:user_details/src/core/base/models/user/user_model.dart';
import 'package:user_details/src/core/base/popup/user_popup.dart';
import 'package:user_details/src/core/components/text/custom_text.dart';

class UserItem extends StatefulWidget {
  final UserModel userModel;
  final int index;
  final void Function()? onPressed;
  const UserItem({
    super.key,
    required this.userModel,
    this.onPressed,
    required this.index,
  });

  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  @override
  void initState() {
    super.initState();
    Functions.instance
        .provider(context)
        .setUsersImages(widget.userModel.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => userPopup(context, widget.userModel,
          Functions.instance.provider(context).userImages[widget.index]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Functions.instance.provider(context).userImages.isEmpty
                    ? const SizedBox.shrink()
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            Functions.instance
                                .provider(context)
                                .userImages[widget.index],
                            width: 15.w,
                            height: 5.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(widget.userModel.name ?? ''),
                    CustomText(widget.userModel.username ?? '')
                  ],
                ),
              ],
            ),
          ),
          IconButton(icon: Icon(Icons.send), onPressed: widget.onPressed),
        ],
      ),
    );
  }
}
