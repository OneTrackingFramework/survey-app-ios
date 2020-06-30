import 'package:json_annotation/json_annotation.dart';

import 'answer.dart';
import 'container.dart';

part 'question.g.dart';

abstract class Question {
  int id;
  String question;
  bool optional;
  Container container;

  Question(this.id, this.question, this.optional);

  factory Question.fromJson(Map<String, dynamic> json) {
    switch (json["type"]) {
      case "BOOL":
        return _$BooleanQuestionFromJson(json);
      case "CHOICE":
        return _$ChoiceQuestionFromJson(json);
      case "RANGE":
        return _$RangeQuestionFromJson(json);
      case "TEXT":
        return _$TextQuestionFromJson(json);
      case "NUMBER":
        return _$NumberQuestionFromJson(json);
      case "CHECKLIST":
        return _$ChecklistQuestionFromJson(json);
      default: //not supported
        return null;
    }
  }

  Map<String, dynamic> toJson();
}

@JsonSerializable(explicitToJson: true)
class BooleanQuestion extends Question {
  int id;
  String question;
  bool optional;
  Container container;
  bool defaultAnswer;

  BooleanQuestion(
      {int id,
      String question,
      bool optional,
      this.container,
      this.defaultAnswer = false})
      : super(id, question, optional);

  factory BooleanQuestion.fromJson(Map<String, dynamic> json) =>
      _$BooleanQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$BooleanQuestionToJson(this);
}

@JsonSerializable()
class ChecklistEntry {
  int id;
  String question;
  int order;
  bool defaultAnswer;

  ChecklistEntry({this.id, this.question, this.order, this.defaultAnswer});

  factory ChecklistEntry.fromJson(Map<String, dynamic> json) =>
      _$ChecklistEntryFromJson(json);

  Map<String, dynamic> toJson() => _$ChecklistEntryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ChecklistQuestion extends Question {
  List<ChecklistEntry> entries;

  ChecklistQuestion({int id, String question, bool optional, this.entries})
      : super(id, question, optional);

  factory ChecklistQuestion.fromJson(Map<String, dynamic> json) =>
      _$ChecklistQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$ChecklistQuestionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ChoiceQuestion extends Question {
  Container container;
  List<Answer> answers;
  int defaultAnswer;
  bool multiple;

  ChoiceQuestion(
      {int id,
      String question,
      bool optional,
      this.container,
      this.answers,
      this.defaultAnswer,
      this.multiple = false})
      : super(id, question, optional);

  factory ChoiceQuestion.fromJson(Map<String, dynamic> json) =>
      _$ChoiceQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$ChoiceQuestionToJson(this);
}

@JsonSerializable()
class RangeQuestion extends Question {
  int minValue;
  int maxValue;
  String minText;
  String maxText;
  int defaultValue;

  RangeQuestion(int id, String question, bool optional, this.minValue,
      this.maxValue, this.minText, this.maxText, this.defaultValue)
      : super(id, question, optional);

  Map<String, dynamic> toJson() => _$RangeQuestionToJson(this);
}

@JsonSerializable()
class TextQuestion extends Question {
  TextQuestion(
      {int id,
      String question,
      bool optional,
      bool multiline = false,
      int length = 0})
      : super(id, question, optional);

  Map<String, dynamic> toJson() => _$TextQuestionToJson(this);
}

@JsonSerializable()
class NumberQuestion extends Question {
  int minValue;
  int maxValue;
  int defaultValue;

  NumberQuestion(int id, String question, bool optional, this.minValue,
      this.maxValue, this.defaultValue)
      : super(id, question, optional);

  Map<String, dynamic> toJson() => _$NumberQuestionToJson(this);
}
