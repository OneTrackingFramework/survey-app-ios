import 'package:json_annotation/json_annotation.dart';

part 'survey_response.g.dart';

@JsonSerializable()
class SurveyResponse {
  int questionId;
  List<int> answerIds;
  bool boolAnswer;
  String textAnswer;
  Map<int, bool> checklistAnswer;
  int numberAnswer;
  String surveyToken;
  bool skipped;
}
