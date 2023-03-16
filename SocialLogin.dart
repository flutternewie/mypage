import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testrtt/funtions/KakaoLogin.dart' as kakao;
import 'package:testrtt/funtions/loginview.dart';
import 'package:testrtt/main.dart';
import 'package:http/http.dart' as http;
import '../screen/myPage.dart';
import 'certificationPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class SocialLogin extends StatefulWidget {
  const SocialLogin({Key? key}) : super(key: key);

  @override
  State<SocialLogin> createState() => _SocialLoginState();
}

class _SocialLoginState extends State<SocialLogin> {
  final Kakaoview = LoginView(kakao.KakaoLogin());

  @override
  Widget build(BuildContext contextlogin) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: TextButton(
                    onPressed: () async {
                      await Kakaoview.login();
                      setState(() {});
                    },
                    style: ButtonStyle(
                      maximumSize: MaterialStateProperty.all(
                          Size(240.0, 60.0)), // 원하는 크기로 지정
                    ),
                    child: Image.asset('asset/kakao_login.png'),
                  ),
                );
              }
              // 로그인이 되어 있으면 미리 만들어둔 MyPage 페이지로 이동하고 싶습니다.
                return Container();
              }
            ),
      ),
    );
  }
}
