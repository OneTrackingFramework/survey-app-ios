import 'package:json_annotation/json_annotation.dart';

import 'answer.dart';
import 'container.dart';

part 'question.g.dart';

abstract class Question {
  final int id;
  final String question;
  final bool optional;
  final Container container;

  Question({this.id, this.question, this.optional, this.container = null});

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

  @override
  String toString() {
    return 'Question{id: $id, question: $question, optional: $optional, container: $container}';
  }
}

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class BooleanQuestion extends Question {
  final bool defaultAnswer;

  BooleanQuestion(
      {int id,
      String question,
      bool optional,
      Container container,
      this.defaultAnswer = false})
      : super(
            id: id,
            question: question,
            optional: optional,
            container: container);

  factory BooleanQuestion.fromJson(Map<String, dynamic> json) =>
      _$BooleanQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$BooleanQuestionToJson(this);
}

@JsonSerializable(includeIfNull: false, explicitToJson: true)
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

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class ChecklistQuestion extends Question {
  final List<ChecklistEntry> entries;

  ChecklistQuestion({int id, String question, bool optional, this.entries})
      : super(id: id, question: question, optional: optional);

  factory ChecklistQuestion.fromJson(Map<String, dynamic> json) =>
      _$ChecklistQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$ChecklistQuestionToJson(this);
}

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class ChoiceQuestion extends Question {
  final List<Answer> answers;
  final int defaultAnswer;
  final bool multiple;

  ChoiceQuestion({int id,
    String question,
    bool optional,
    Container container,
    this.answers,
    this.defaultAnswer,
    this.multiple = false})
      : super(
      id: id,
      question: question,
      optional: optional,
      container: container);

  factory ChoiceQuestion.fromJson(Map<String, dynamic> json) =>
      _$ChoiceQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$ChoiceQuestionToJson(this);
}

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class RangeQuestion extends Question {
  final int minValue;
  final int maxValue;
  final String minText;
  final String maxText;
  final int defaultValue;

  RangeQuestion(int id, String question, bool optional, this.minValue,
      this.maxValue, this.minText, this.maxText, this.defaultValue)
      : super(id: id, question: question, optional: optional);

  Map<String, dynamic> toJson() => _$RangeQuestionToJson(this);
}

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class TextQuestion extends Question {
  final bool multiline;
  final int length;

  TextQuestion({int id,
    String question,
    bool optional,
    this.multiline = false,
    this.length = 0})
      : super(id: id, question: question, optional: optional);

  Map<String, dynamic> toJson() => _$TextQuestionToJson(this);
}

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class NumberQuestion extends Question {
  final int minValue;
  final int maxValue;
  final int defaultValue;

  NumberQuestion(int id, String question, bool optional, this.minValue,
      this.maxValue, this.defaultValue)
      : super(id: id, question: question, optional: optional);

  Map<String, dynamic> toJson() => _$NumberQuestionToJson(this);
}
