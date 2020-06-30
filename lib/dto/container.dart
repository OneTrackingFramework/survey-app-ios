import 'package:json_annotation/json_annotation.dart';

import 'question.dart';
import 'suervey_response.dart';

part 'container.g.dart';

abstract class Container {
  List<Question> subQuestions = List();

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
}

@JsonSerializable()
class BooleanContainer extends Container {
  bool boolDependsOn;

  BooleanContainer(bool boolDependsOn, List<Question> subQuestions)
      : super(subQuestions);

  @override
  bool matchAnswer(SurveyResponse response) {
    return boolDependsOn == response.boolAnswer;
  }

  Map<String, dynamic> toJson() => _$BooleanContainerToJson(this);
}

@JsonSerializable()
class ChoiceContainer extends Container {
  List<int> choiceDependsOn;

  ChoiceContainer(List<int> choiceDependsOn, List<Question> subQuestions)
      : super(subQuestions);

  @override
  bool matchAnswer(SurveyResponse response) {
    return choiceDependsOn.contains(response.answerIds.first);
  }

  Map<String, dynamic> toJson() => _$ChoiceContainerToJson(this);
}
