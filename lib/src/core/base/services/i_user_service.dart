import 'package:user_details/src/core/base/models/image/image_model.dart';
import 'package:user_details/src/core/base/models/user/user_model.dart';

abstract class IUserService {
  Future<List<UserModel>> fetchUserDetails();
  Future<ImageModel> fetchUserImages(String id);
}
