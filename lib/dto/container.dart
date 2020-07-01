import 'package:json_annotation/json_annotation.dart';

import 'question.dart';
import 'survey_response.dart';

part 'container.g.dart';

abstract class Container {
  final List<Question> subQuestions;

  Container(this.subQuestions);

  bool matchAnswer(SurveyResponse response);

  factory Container.fromJson(Map<String, dynamic> json) {
    switch (json["type"]) {
      case "BOOL":
        return _$BooleanContainerFromJson(json);
      case "CHOICE":
        return _$ChoiceContainerFromJson(json);
      default: //not supported
        return null;
    }
  }

  Map<String, dynamic> toJson();

  @override
  String toString() {
    return 'Container{subQuestions: $subQuestions}';
  }
}

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class BooleanContainer extends Container {
  final bool boolDependsOn;

  BooleanContainer(this.boolDependsOn, List<Question> subQuestions)
      : super(subQuestions);

  @override
  bool matchAnswer(SurveyResponse response) {
    return boolDependsOn == response.boolAnswer;
  }

  Map<String, dynamic> toJson() => _$BooleanContainerToJson(this);
}

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class ChoiceContainer extends Container {
  final List<int> choiceDependsOn;

  ChoiceContainer(this.choiceDependsOn, List<Question> subQuestions)
      : super(subQuestions);

  @override
  bool matchAnswer(SurveyResponse response) {
    return choiceDependsOn.contains(response.answerIds.first);
  }

  Map<String, dynamic> toJson() => _$ChoiceContainerToJson(this);
}
