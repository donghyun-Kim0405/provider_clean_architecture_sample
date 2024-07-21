

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider_clean_architecture/structure/configs/base_build_config.dart';
import 'package:provider_clean_architecture/structure/configs/empty_logger.dart';
import 'package:provider_clean_architecture/structure/configs/env_enums.dart';
import 'package:provider_clean_architecture/structure/managers/route_manager.dart';
import 'package:provider_clean_architecture/structure/utils/size_util.dart';
import 'package:provider_clean_architecture/structure/values/base_app_colors.dart';

abstract class AppInitiator {

  static late Logger _logger;
  static Logger get logger => _logger;

  static late String _baseUrl;
  static String get baseUrl => _baseUrl;

  static late String _refreshTokenEndPoint;
  static String get refreshTokenEndPoint => _refreshTokenEndPoint;

  static late String _accessTokenEndPoint;
  static String get accessTokenEndPoint => _accessTokenEndPoint;

  static late String _routeForLoggedOut;
  static String get routeForLoggedOut => _routeForLoggedOut;

  static late BaseAppColor _baseAppColor;
  static BaseAppColor get baseAppColor => _baseAppColor;

  static materialApp({
    required BaseBuildConfig buildConfig,
    required String initialRoute,
    String routeForLoggedOut = '/',
    required Map<String, WidgetBuilder> routes,
    required List<SingleChildWidget> providers,
    Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,
    Iterable<Locale>? supportedLocales,
    ThemeMode? themeMode,
    ThemeData? themeData,
    required BaseAppColor baseAppColor,
  }) {

    _logger = (buildConfig.envType == EnvType.PRO) ? EmptyLogger() : Logger();
    _logger = logger;
    _baseUrl = buildConfig.baseUrl;
    _accessTokenEndPoint = buildConfig.accessTokenEndPoint;
    _refreshTokenEndPoint = buildConfig.refreshTokenEndPoint;
    _routeForLoggedOut = routeForLoggedOut;
    _baseAppColor = baseAppColor;

    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: buildConfig.appTitle,
        initialRoute: initialRoute,
        routes: routes,
        builder: (context, child) {

          SizeUtil.setSizeUsingContext(context);

          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
        supportedLocales: supportedLocales ?? [
          const Locale('en', 'US'),
          const Locale('ko', 'KR'),
        ],
        themeMode: themeMode ?? ThemeMode.light,
        theme: themeData ?? ThemeData(primaryColor: Colors.blue),
        localizationsDelegates: localizationsDelegates ?? const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        navigatorObservers: [
          RouteManager.instance
        ],
        navigatorKey: RouteManager.instance.navigatorKey,
      ),
    );
  }


}