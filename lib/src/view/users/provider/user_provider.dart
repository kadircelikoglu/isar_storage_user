import 'package:flutter/material.dart';
import 'package:user_details/src/core/base/models/user/user_model.dart';
import 'package:user_details/src/core/base/services/user_service.dart';
import 'package:user_details/src/core/init/locator.dart';
import 'package:user_details/src/view/users/provider/provider_states.dart';

class UserProvider with ChangeNotifier {
  List<UserModel> cloneUsers = [];
  List<String> userImages = [];
  TextEditingController controller = TextEditingController();

  final UserService service = locator<UserService>();

  ProviderState _state = InitialSearchState();

  ProviderState get state => _state;

  set state(ProviderState value) {
    _state = value;
    notifyListeners();
  }

  setUsersToCloneUsers() async {
    final response = await service.fetchUserDetails();
    cloneUsers = response;
    notifyListeners();
  }

  setUsersImages(String id) async {
    final response = await service.fetchUserImages(id);
    userImages.add(response.downloadUrl.toString());
    notifyListeners();
  }

  Future<void> filterSearch(String query) async {
    if (query.toLowerCase().isEmpty) {
      state = InitialSearchState();
    } else {
      state = SearchLoading();
      try {
        List<UserModel> response = await service.fetchUserDetails();
        final findValues = response
            .where((element) =>
                element.username!.toLowerCase().contains(query.toLowerCase()))
            .toList();
        if (findValues.isEmpty) {
          state = SearchEmpty();
        } else {
          response = findValues;
          state = SearchLoaded(users: findValues);
        }
      } catch (e) {
        state = SearchError();
      }
    }
  }

  void resetFilter() {
    state = InitialSearchState();
  }
}
