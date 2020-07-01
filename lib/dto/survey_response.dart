import 'package:json_annotation/json_annotation.dart';

part 'survey_response.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class SurveyResponse {
  final int questionId;
  final List<int> answerIds;
  final bool boolAnswer;
  final String textAnswer;
  final Map<int, bool> checklistAnswer;
  final int numberAnswer;
  final String surveyToken;
  final bool skipped;

  SurveyResponse(
      {this.questionId,
      this.answerIds,
      this.boolAnswer,
      this.textAnswer,
      this.checklistAnswer,
      this.numberAnswer,
      this.surveyToken,
      this.skipped});
}
