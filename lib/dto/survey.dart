import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

import 'question.dart';

part 'survey.g.dart';

@JsonSerializable()
class Survey {
  List<Question> questions;
  String nameId;
  String title; //null
  String description; // null,
  int version;

  Survey(
      this.questions, this.nameId, this.title, this.description, this.version);

  factory Survey.fromJson(Map<String, dynamic> json) => _$SurveyFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyToJson(this);
}

@JsonSerializable(includeIfNull: false)
class SurveyStatus {
  int countQuestions;
  String nameId;
  String description;
  String title;
  int nextQuestionId;
  Status status;
  String token;

  //@Nullable
  int startTime;
  int endTime;
  String dependsOn;

  SurveyStatus(
      {this.countQuestions,
      this.nameId,
      this.description,
      this.title,
      this.nextQuestionId,
      this.status,
      this.token,
      this.startTime,
      this.endTime,
      this.dependsOn});

  factory SurveyStatus.fromJson(Map<String, dynamic> json) =>
      _$SurveyStatusFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyStatusToJson(this);

  @override
  String toString() {
    return 'SurveyStatus{countQuestions: $countQuestions, nameId: $nameId, description: $description, title: $title, nextQuestionId: $nextQuestionId, status: $status, token: $token, startTime: $startTime, endTime: $endTime, dependsOn: $dependsOn}';
  }
}

enum Status { INCOMPLETE, COMPLETED, NEW }
