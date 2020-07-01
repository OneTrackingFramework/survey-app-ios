import 'package:framework/network/survey_api.dart';
import 'package:test/test.dart';

void main() {
  final api = createSurveyApi("host", "token");

  test('get overview', () async {
    final list = await api.overviews();
    print(list);
  });

  test('get survey', () async {
    final list = await api.overviews();
    final survey = await api.survey(list.first.nameId);
    print(survey);
  });
}
