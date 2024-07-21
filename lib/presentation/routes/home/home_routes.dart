
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider_clean_architecture/core/values/app_text_style.dart';
import 'package:provider_clean_architecture/structure/base/base_route.dart';

import '../../notifiers/home/home_notifier.dart';

class HomeRoutes extends BaseRoutes<HomeNotifier> {

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: () {
              notifier.fetchTestData();
            },
            child: Text('get Test Message')
        ),

        Text(
          notifier.testMsg,
          style: AppTextStyle.blackw700.copyWith(fontSize: 30, color: CupertinoColors.white),
        )
      ],
    );
  }


}