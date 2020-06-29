abstract class Question {
  int id;
  String question;
  bool optional;
  Container container;

  Question(this.id, this.question, this.optional);
}

class BooleanQuestion extends Question {
  BooleanQuestion(
      {int id,
      String question,
      bool optional,
      Container container,
      bool defaultAnswer = false})
      : super(id, question, optional);
}

class ChecklistEntry {
  int id;
  String question;
  int order;
  bool defaultAnswer;
}

class ChecklistQuestion extends Question {
  ChecklistQuestion(
      {int id, String question, bool optional, List<ChecklistEntry> entries})
      : super(id, question, optional);
}

class ChoiceQuestion extends Question {
  ChoiceQuestion(
      {int id,
      String question,
      bool optional,
      Container container,
      List<Answer> answers,
      int defaultAnswer,
      bool multiple = false})
      : super(id, question, optional);
}

class RangeQuestion extends Question {
  RangeQuestion(int id, String question, bool optional, int minValue,
      int maxValue, String minText, String maxText, int defaultValue)
      : super(id, question, optional);
}

class TextQuestion extends Question {
  TextQuestion(
      {int id,
      String question,
      bool optional,
      bool multiline = false,
      int length = 0})
      : super(id, question, optional);
}

class NumberQuestion extends Question {
  NumberQuestion(int id, String question, bool optional, int minValue,
      int maxValue, int defaultValue)
      : super(id, question, optional);
}

class Answer {
  int id;
  String value;
}

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

abstract class Container {
  List<Question> subQuestions = List.empty(growable: true);

  Container(this.subQuestions);

  bool matchAnswer(SurveyResponse response);
}

class BooleanContainer extends Container {
  bool boolDependsOn;

  BooleanContainer(bool boolDependsOn, List<Question> subQuestions)
      : super(subQuestions);

  @override
  bool matchAnswer(SurveyResponse response) {
    return boolDependsOn == response.boolAnswer;
  }
}

class ChoiceContainer extends Container {
  List<int> choiceDependsOn;

  ChoiceContainer(List<int> choiceDependsOn, List<Question> subQuestions)
      : super(subQuestions);

  @override
  bool matchAnswer(SurveyResponse response) {
    return choiceDependsOn.contains(response.answerIds.first);
  }
}
