import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_clean_architecture/core/configs/app_build_config.dart';
import 'package:provider_clean_architecture/core/dependency_injectors/notifiers_providers/onboarding_notifiers_providers.dart';
import 'package:provider_clean_architecture/core/dependency_injectors/repository_providers.dart';
import 'package:provider_clean_architecture/core/routes/app_pages.dart';
import 'package:provider_clean_architecture/core/routes/app_routes_name.dart';
import 'package:provider_clean_architecture/core/values/app_colors.dart';
import 'package:provider_clean_architecture/structure/app_initiator.dart';
import 'package:provider_clean_architecture/structure/configs/env_enums.dart';
import 'package:provider_clean_architecture/structure/values/base_app_colors.dart';

void main() {

  BuildConfig.initialize(
    envType: EnvType.DEV,
    appTitle: 'Provider Clean Architecture',
    baseUrl: '만약 Firebase 기반이 아닌 REST api Server운영 중이라면 이곳에 baseUrl 작성',
    accessTokenEndPoint: '만약 jwt 로그인 방식으로 운영한다면 이곳에 accessToken발급을 위한 endPoint를 작성',
    refreshTokenEndPoint: '만약 jwt 로그인 방식으로 운영한다면 이곳에 refreshToken발급을 위한 endPoint를 작성',
    usingMockRepository: true
  );

  runApp(
    AppInitiator.materialApp(
        buildConfig: BuildConfig.instance,
        initialRoute: AppRoutesName.SPLASH,
        routes: appRoutes,
        providers: [
          ...repositoryProviders,
          ...onBoardingNotifierProviders,
        ],
        baseAppColor: BaseAppColor(
            mainBackgroundColor: AppColors.mainBackgroundColor,
            elevatedContainerColorOpacity: Colors.grey.withOpacity(0.5),

        )
    )
  );
}

