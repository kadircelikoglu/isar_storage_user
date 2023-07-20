import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:user_details/src/core/base/models/address/address_model.dart';
import 'package:user_details/src/core/base/models/company/company_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel with EquatableMixin {
  int? id;
  String? name, username, email, phone, website;
  AddressModel? address;
  CompanyModel? company;

  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props =>
      [id, name, username, email, address, phone, website, company];
}
