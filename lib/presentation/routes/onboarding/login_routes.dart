
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_clean_architecture/presentation/notifiers/onboarding/login_notifier.dart';
import 'package:provider_clean_architecture/structure/base/base_route.dart';

class LoginRoutes extends BaseRoutes<LoginNotifier> {
  LoginRoutes({super.key});

  @override
  Widget body(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            'email'
        ),
        TextField(
          controller: notifier.emailController,
        ),
        SizedBox(height: 16,),
        Text(
            'pwd'
        ),
        TextField(
          controller: notifier.pwdController,
        ),

        TextButton(
            onPressed: () async {
              await notifier.login();
            },
            child: Text(
                'login'
            )
        )

      ],
    );
  }
}
