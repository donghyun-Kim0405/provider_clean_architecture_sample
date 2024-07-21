
import 'package:flutter/cupertino.dart';
import 'package:provider_clean_architecture/core/routes/app_routes_name.dart';
import 'package:provider_clean_architecture/domain/usecases/login_usecase.dart';
import 'package:provider_clean_architecture/structure/base/base_notifier.dart';

import '../../../structure/managers/route_manager.dart';

class LoginNotifier extends BaseNotifier {

  final LoginUseCase loginUseCase;

  LoginNotifier({required this.loginUseCase});

  late TextEditingController emailController;
  late TextEditingController pwdController;

  @override
  void onInit() {
    emailController = TextEditingController();
    pwdController = TextEditingController();
    super.onInit();
  }

  Future<void> login() async {
    await callDataService(
      futureProvider: () => loginUseCase(LoginUseCaseParam(email: emailController.text, pwd: pwdController.text)),
      onSuccess: (failOrSuccess) {
        failOrSuccess.fold(
                (fail) => null,
                (success) {
                  RouteManager.instance.pushNamed(
                  	context: null,
                  	routes: AppRoutesName.HOME
                  );
                }
        );
      }

    );
  }


  @override
  void dispose() {
    super.dispose();
  }


}