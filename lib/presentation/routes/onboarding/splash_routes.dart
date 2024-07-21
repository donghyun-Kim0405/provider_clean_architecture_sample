

import 'package:flutter/cupertino.dart';
import 'package:provider_clean_architecture/core/values/app_text_style.dart';
import 'package:provider_clean_architecture/presentation/notifiers/onboarding/splash_notifier.dart';
import 'package:provider_clean_architecture/structure/base/base_route.dart';

class SplashRoutes extends BaseRoutes<SplashNotifier> {
  SplashRoutes({super.key});

  @override
  Widget body(BuildContext context) {

    return const Center(
      child: Text(
        'Spalsh LOGO Area',
        style: AppTextStyle.blackw600,
      ),
    );
  }
}
