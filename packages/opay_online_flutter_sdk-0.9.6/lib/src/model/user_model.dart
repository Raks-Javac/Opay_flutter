
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserInfo{
  String? userId;
  String? userEmail;
  String? userMobile;
  String? userName;
  UserInfo(this.userId,this.userEmail,this.userMobile,this.userName);
  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}