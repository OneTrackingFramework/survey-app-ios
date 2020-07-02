import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:framework/dto/verification.dart';
import 'package:framework/dto/verification_response.dart';
import 'package:framework/network/register_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_links/uni_links.dart';

void main() {
  runApp(SplashPage());
}

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title: Text("Spash Screen"))),
    );
  }

  @override
  void initState() {
    super.initState();
    initUniLinks();
  }

  Future<Null> initUniLinks() async {
    try {
      Uri initialLink = await getInitialUri();
      if (initialLink != null) {
        String clientId = "ebc02dfc-744d-425d-8594-a27899476fe1";
        String clientSecret = "f0cf668e-b1e6-46ff-bc01-c695bc3a84ff";
        RegisterApi api = createRegisterApi(
            "https://survey-mgmt-service-uon.azurewebsites.net/");
        VerificationResponse verificationResponse = await api.verify(
            'Basic ' + base64Encode(utf8.encode('$clientId:$clientSecret')),
            Verification("", ""));
        print(verificationResponse.token);
        final prefs = await SharedPreferences.getInstance();
        prefs.setString("token", verificationResponse.token);
      } else {
        print(" null");
      }
    } on PlatformException {
      // Handle exception by warning the user their action did not succeed
      // return?
    }
  }
}
