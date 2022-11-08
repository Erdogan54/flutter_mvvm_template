import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable/builder.dart';

import '../../../../core/base/model/base_model.dart';

part 'test_model.g.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

@JsonSerializable()
class TestModel extends BaseModel {
  int? userId;
  int? id;
  String? title;
  bool? complated;
  TestModel({
     this.userId,
     this.id,
     this.title,
     this.complated,
  });

  @override
  toJson() {
    return _$TestModelToJson(this).cast<String,Object>();
  }

  @override
  fromJson(Map<String, Object> json) {
    return _$TestModelFromJson(json);
  }
}
