import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:user_details/src/core/base/models/geo/geo_model.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel with EquatableMixin {
  String? street, suite, city, zipcode;
  GeoModel? geo;

  AddressModel({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);

  @override
  List<Object?> get props => [street, suite, city, zipcode, geo];
}
