
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider_clean_architecture/structure/app_initiator.dart';

/**
 *
 * CustomException으로 예외를 던지는 것은 모두 앱의 분기처리 혹은 비즈니스 로직에 영향을 주지않고
 * 모두 Toast Message를 띄울것을 약속한다.
 *
 * */

class CustomException implements Exception {
  final String msgForUser;
  final String msgForDev;
  final StackTrace? stackTrace;
  CustomException({this.msgForUser = "", this.msgForDev = "", this.stackTrace, }) {
    log();
  }

  void log() {
    AppInitiator.logger.e("${this.runtimeType} - $msgForDev");
    AppInitiator.logger.e("${this.runtimeType} - $stackTrace");
    debugPrintStack();
  }

  void showToastMessage() => Fluttertoast.showToast(msg: msgForUser);

}

