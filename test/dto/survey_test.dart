import 'package:framework/dto/survey.dart';
import 'package:test/test.dart';

void main() {
  test('Parsing of SurveyStatus', () {
    final json = {
      "nameId": "REGULAR",
      "title": "Regular survey",
      "countQuestions": 24,
      "status": "INCOMPLETE",
      "token": "69sVPW0q",
      "startTime": 1593388800000,
      "endTime": 1593993599000,
      "dependsOn": "BASIC"
    };

    final status = SurveyStatus.fromJson(json);

    expect(status.status, Status.INCOMPLETE);
    expect(status.countQuestions, 24);
    expect(status.nameId, "REGULAR");

    expect(json, status.toJson());
  });
}
