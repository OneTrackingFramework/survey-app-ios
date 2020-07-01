import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

import 'question.dart';

part 'survey.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Survey {
  final List<Question> questions;
  final String nameId;
  final String title; //null
  final String description; // null,
  final int version;

  Survey(
      {this.questions,
      this.nameId,
      this.title,
      this.description,
      this.version});

  factory Survey.fromJson(Map<String, dynamic> json) => _$SurveyFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyToJson(this);

  @override
  String toString() {
    return 'Survey{questions: $questions, nameId: $nameId, title: $title, description: $description, version: $version}';
  }
}

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class SurveyStatus {
  final int countQuestions;
  final String nameId;
  final String description;
  final String title;
  final int nextQuestionId;
  final Status status;
  final String token;

  //@Nullable
  final int startTime;
  final int endTime;
  final String dependsOn;

  const SurveyStatus(
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
