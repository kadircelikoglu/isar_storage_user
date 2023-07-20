import 'package:flutter_test/flutter_test.dart';
import 'package:user_details/src/core/base/services/i_user_service.dart';
import 'package:user_details/src/core/base/services/user_service.dart';

void main() {
  late IUserService userService;

  setUp(() {
    userService = UserService();
  });

  test('fetchUserImages', () async {
    final res = await userService.fetchUserImages("3");
    print(res.url);
  });
}
