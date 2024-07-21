import 'dart:async';
import 'dart:math';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:provider_clean_architecture/structure/app_initiator.dart';
import '../enums/app_state.dart';
import '../enums/page_state.dart';
import '../exceptions/custom_exception/custom_exception.dart';
import '../managers/route_manager.dart';
import '../utils/size_util.dart';

abstract class BaseNotifier extends ChangeNotifier with WidgetsBindingObserver {
  BaseNotifier() {
    WidgetsBinding.instance.addObserver(this);
    onInit();
  }

  Logger logger = AppInitiator.logger;

  AppState _appState = AppState.ON_RESUME;
  PageState _pageState = PageState.DEFAULT;

  PageState get pageState => _pageState;

  void updatePageState({required PageState pageState}) {
    _pageState = pageState;
    notifyListeners();
  }

  void resetPageState() {
    _pageState = PageState.DEFAULT;
    notifyListeners();
  }

  void showLoading() {
    _pageState = PageState.LOADING;
    notifyListeners();
  }

  void hideLoading() {
    resetPageState();
  }

  void showToastMessage({required String message}) {
    Fluttertoast.showToast(msg: message);
  }

  AppLifecycleState? lastLifeCycle;

  @override
  void didChangeMetrics() {
    final BuildContext? context = RouteManager.instance.navigatorKey.currentState?.context;
    if (context != null && _appState == AppState.ON_RESUME) {
      SizeUtil.setSizeUsingContext(context);
    }
    super.didChangeMetrics();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    manageLifecycle(appLifecycleState: state);
    super.didChangeAppLifecycleState(state);
  }

  void onInit() {
    logger.i("constructor called() - onInit()");
  }

  void onResumed() {
    _appState = AppState.ON_RESUME;
    logger.i("onResume() - $runtimeType");
  }

  void onInActive() {
    _appState = AppState.ON_IN_ACTIVE;
    logger.i("onInActive() - $runtimeType");
  }

  void onPaused() {
    _appState = AppState.ON_PAUSED;
    logger.i("onPaused() - $runtimeType");
  }

  void onDetached() {
    _appState = AppState.ON_DETACHED;
    logger.i("onDetached() - $runtimeType");
  }

  void onHidden() {
    _appState = AppState.ON_HIDDEN;
    logger.i("onHidden() - $runtimeType");
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    logger.i("BaseController - dispose() called");
    super.dispose();
  }

  void manageLifecycle({required AppLifecycleState appLifecycleState}) {
    if (appLifecycleState == lastLifeCycle) return;

    lastLifeCycle = appLifecycleState;
    logger.i("App LifeCycle Changed - $appLifecycleState");

    switch (appLifecycleState) {
      case AppLifecycleState.resumed:
        onResumed();
        break;
      case AppLifecycleState.inactive:
        onInActive();
        break;
      case AppLifecycleState.paused:
        onPaused();
        break;
      case AppLifecycleState.detached:
        onDetached();
        break;
    }
  }

  dynamic callDataService<T>(
      { required Future<T> Function() futureProvider,
        Function(Exception exception)? onError,
        Function(T response)? onSuccess,
        Function? onStart,
        Function? onComplete,
        bool doNotWhenLoading = false
      }) async {

    if(doNotWhenLoading && pageState == PageState.LOADING) return;

    CustomException? _exception;
    StackTrace? _stackTrace;

    onStart == null ? showLoading() : onStart();

    try {
      final T response = await futureProvider();

      onComplete == null ? hideLoading() : onComplete();

      if (onSuccess != null) onSuccess(response);

      return response;
    } on CustomException catch (customException, stackTrace) {

      customException.log();
      _exception = customException; /// customException이 들어왔다는것은 이미 가공되었다는 의미로 아무동작도 수행하지 않고 그대로 할당만하고 넘어감
      _stackTrace = stackTrace;
    } catch (e, s) {
      logger.e("BaseController.CallDataService 오류 발생 마지막 Catch 까지 이동  - Error: ${e.toString()}");
      _exception = CustomException(msgForUser: "오류가 발생했습니다. 증상이 지속되면 관리자에게 문의하세요.");
      _stackTrace = s;
    }

    /// 이 지점에 도달했다는것은 위 try문안에서 return 하지 못했으므로 오류가 있다고 가정하고 CrashLytics에 보고
    await FirebaseCrashlytics.instance.recordError(_exception.msgForDev, _stackTrace ?? StackTrace.current, printDetails: true);

    if (onError != null) {
      onError(_exception);
    } else {
      showToastMessage(message: _exception.msgForUser);
    }

    onComplete == null ? hideLoading() : onComplete();
  }
}
