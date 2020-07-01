import 'package:json_annotation/json_annotation.dart';

part 'answer.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Answer {
  final int id;
  final String value;

  Answer({this.id, this.value});

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerToJson(this);

  @override
  String toString() {
    return 'Answer{id: $id, value: $value}';
  }
}
