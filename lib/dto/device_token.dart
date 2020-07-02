import 'package:json_annotation/json_annotation.dart';

part 'device_token.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class DeviceToken {
  final String token;

  DeviceToken({
    this.token,
  });

  factory DeviceToken.fromJson(Map<String, dynamic> json) =>
      _$DeviceTokenFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceTokenToJson(this);
}
