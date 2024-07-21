

import 'package:flutter/cupertino.dart';
import 'package:provider_clean_architecture/core/routes/app_routes_name.dart';
import 'package:provider_clean_architecture/domain/usecases/fetch_user_info_usecase.dart';
import 'package:provider_clean_architecture/structure/base/base_notifier.dart';

import '../../../structure/managers/route_manager.dart';

class SplashNotifier extends BaseNotifier {

  final FetchUserInfoUseCase fetchUserInfoUseCase;

  SplashNotifier({required this.fetchUserInfoUseCase});

  @override
  onInit(){
    fetchUserInfo();
    super.onInit();
  }

  Future<void> fetchUserInfo() async {
    await callDataService(
      futureProvider: () => fetchUserInfoUseCase(FetchUserInfoUseCaseParam()),
      onSuccess: (failOrSuccess) {
        failOrSuccess.fold(
                (fail) {
                  RouteManager.instance.pushNamed(
                  	context: null,
                  	routes: AppRoutesName.LOGIN
                  );
                },
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


}