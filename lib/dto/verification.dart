import 'package:json_annotation/json_annotation.dart';

part 'verification.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Verification {
  final String verificationToken;
  final String confirmationToken;

  Verification(
    this.verificationToken,
    this.confirmationToken,
  );

  factory Verification.fromJson(Map<String, dynamic> json) =>
      _$VerificationFromJson(json);

  Map<String, dynamic> toJson() => _$VerificationToJson(this);
}
