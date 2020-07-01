import 'package:framework/network/survey_api.dart';
import 'package:test/test.dart';

void main() {
  test('get overview', () async {
    final api = createSurveyApi("host", "token");
    final list = await api.overviews();
    print(list);
  });
}
