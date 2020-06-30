import 'package:dio/dio.dart';
import 'package:framework/dto/survey.dart';
import 'package:retrofit/retrofit.dart';

part 'survey_api.g.dart';

@RestApi()
abstract class SurveyApi {
  factory SurveyApi(Dio dio, {String baseUrl}) = _SurveyApi;

//  @GET("/tasks")
//  Future<List<Task>> get  Tasks();

  @GET("survey/{id}")
  Future<Survey> survey(@Path("id") String id);

//  @POST("survey/{nameId}/answer")
//  void sendQuestionAnswer(@Path("nameId") String nameId, @Body RequestBody body)
  @GET("overview")
  Future<List<SurveyStatus>> overviews();

  @GET("overview/{nameId}")
  Future<SurveyStatus> overview(@Path("nameId") String nameId);

//  @POST("health/stepcount")
//  Object stepcount(@Body @NotNull StepCount var1);

}

Dio createDio(String token) {
  return Dio()..interceptors.add(AuthInterceptor(() => Future.value(token)));
}

SurveyApi createSurveyApi(String url, String token) =>
    SurveyApi(createDio(token), baseUrl: url);

class AuthInterceptor extends Interceptor {
  final Future<String> Function() token;

  AuthInterceptor(this.token);

  Future onRequest(RequestOptions options) async {
    final value = await token();
    options.headers["Authorization"] = "Bearer $value";
    return options;
  }
}
