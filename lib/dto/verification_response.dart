import 'package:json_annotation/json_annotation.dart';

part 'verification_response.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class VerificationResponse {
  final String token;

  VerificationResponse({
    this.token,
  });

  factory VerificationResponse.fromJson(Map<String, dynamic> json) =>
      _$VerificationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerificationResponseToJson(this);
}
