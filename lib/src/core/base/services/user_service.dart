import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:user_details/src/core/base/models/image/image_model.dart';
import 'package:user_details/src/core/base/models/user/user_model.dart';
import 'package:user_details/src/core/base/services/i_user_service.dart';
import 'package:user_details/src/core/constants/app/string_constants.dart';
import 'package:user_details/src/core/constants/enum/network_enum.dart';

class UserService extends IUserService {
  @override
  Future<List<UserModel>> fetchUserDetails() async {
    final url = Uri.https(StringConstants.baseUrl, NetworkEnum.users.name);
    final response = await http.get(url);
    if (response.statusCode == HttpStatus.ok) {
      var data = jsonDecode(response.body) as List;
      return data.map((e) => UserModel.fromJson(e)).toList();
    } else {
      return throw Exception();
    }
  }

  @override
  Future<ImageModel> fetchUserImages(String id) async {
    final url = Uri.https(StringConstants.baseUrlImage,
        "/${NetworkEnum.id.name}/$id/${NetworkEnum.info.name}");
    final response = await http.get(url);
    if (response.statusCode == HttpStatus.ok) {
      var data = jsonDecode(response.body);
      return ImageModel.fromJson(data);
    } else {
      return throw Exception();
    }
  }
}
