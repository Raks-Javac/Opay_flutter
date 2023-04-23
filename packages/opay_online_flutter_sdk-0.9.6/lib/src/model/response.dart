

import 'package:json_annotation/json_annotation.dart';
import '../http/http_status.dart';
part 'response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PayHttpResponse<T>{
  ResponseStatus status;
  T data;
  String code;
  String message;

  PayHttpResponse(this.status,this.code,this.message,this.data);

  factory PayHttpResponse.fromJson(Map<String, dynamic> json,
      T Function(dynamic json) fromJsonT) => _$PayHttpResponseFromJson(json,fromJsonT);
  //序列化
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$PayHttpResponseToJson(this,toJsonT);
}