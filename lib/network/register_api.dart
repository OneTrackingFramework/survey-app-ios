import 'package:dio/dio.dart';
import 'package:framework/dto/device_token.dart';
import 'package:framework/dto/verification.dart';
import 'package:framework/dto/verification_response.dart';
import 'package:retrofit/retrofit.dart';

part 'register_api.g.dart';

@RestApi()
abstract class RegisterApi {
  factory RegisterApi(Dio dio, {String baseUrl}) = _RegisterApi;

  @POST("auth/verify")
  Future<VerificationResponse> verify(
      @Header("Authorization") String token, @Body() Verification verification);

  @POST("auth/devicetoken")
  Future<void> deviceToken(
      @Header("Authorization") String token, @Body() DeviceToken deviceToken);
}

RegisterApi createRegisterApi(String url) => RegisterApi(Dio(), baseUrl: url);
