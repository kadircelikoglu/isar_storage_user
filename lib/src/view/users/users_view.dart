import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:user_details/src/core/base/functions/functions.dart';
import 'package:user_details/src/core/components/appbar/custom_appbar.dart';
import 'package:user_details/src/core/components/fab/fab_button.dart';
import 'package:user_details/src/core/components/text/custom_text.dart';
import 'package:user_details/src/core/components/textField/custom_textfield.dart';
import 'package:user_details/src/core/constants/app/string_constants.dart';
import 'package:user_details/src/view/users/provider/provider_states.dart';
import 'package:user_details/src/view/users/provider/user_provider.dart';
import 'package:user_details/src/view/users/widget/initial_widget.dart';
import 'package:user_details/src/view/users/widget/loaded_widget.dart';
import 'package:user_details/src/view/users/widget/not_found_widget.dart';

class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  late UserProvider _userProvider;

  @override
  void initState() {
    super.initState();
    _userProvider = context.read<UserProvider>();
    _userProvider.setUsersToCloneUsers();
  }

  @override
  void dispose() {
    super.dispose();
    _userProvider.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, provider, child) {
        return Scaffold(
            appBar: CustomAppBar(),
            floatingActionButton: FabButton(userProvider: _userProvider),
            body: Column(
              children: [
                Padding(
                    padding: EdgeInsets.all(2.h),
                    child: CustomTextField(userProvider: _userProvider)),
                Expanded(child: _buildWidget(provider.state, provider)),
              ],
            ));
      },
    );
  }

  Widget _buildWidget(ProviderState state, UserProvider provider) {
    if (state is InitialSearchState) {
      return InitialWidget(provider: provider);
    } else if (state is SearchLoading) {
      return Center(child: Functions.instance.platformIndicator());
    } else if (state is SearchEmpty) {
      return NotFoundWidget();
    } else if (state is SearchLoaded) {
      return LoadedWidget(users: state.users);
    } else if (state is SearchError) {
      return CustomText(StringConstants.createdAnError);
    }
    throw Exception('${state.runtimeType} ${StringConstants.createdAnError}');
  }
}
