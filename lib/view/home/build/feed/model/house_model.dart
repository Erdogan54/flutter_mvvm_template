import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'house_model.g.dart';

@JsonSerializable()
class HouseModel extends INetworkModel<HouseModel> {
  @JsonKey(name: "_id")
  String? id;
  String? title;
  String? description;
  String? image;
  UserModel? user;
  int? iV;
  HouseModel({
    this.id,
    this.title,
    this.description,
    this.image,
    this.user,
    this.iV,
  });

  @override
  HouseModel fromJson(Map<String, dynamic> json) {
    return _$HouseModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$HouseModelToJson(this);
  }
}

@JsonSerializable()
class UserModel extends INetworkModel<UserModel> {
  @JsonKey(name: "_id")
  String? id;
  String? name;
  String? image;
  String? date;
  UserModel({
    this.id,
    this.name,
    this.image,
    this.date,
  });

  @override
  UserModel fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$UserModelToJson(this);
  }
}


