
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:provider_clean_architecture/structure/app_initiator.dart';
import 'package:provider_clean_architecture/structure/base/base_notifier.dart';

import '../enums/page_state.dart';
import 'base_widgets/loading.dart';

abstract class BaseRoutes<T extends BaseNotifier> extends StatelessWidget {

  late T _notifier;
  T get notifier => _notifier;

  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  final Logger logger = AppInitiator.logger;

  late BuildContext mContext;

  BaseRoutes({super.key});

  Widget body(BuildContext context);

  @override
  Widget build(BuildContext context) {
    mContext = context;
    _notifier = mContext.watch<T>();

    return Stack(
      children: [
        annotatedRegion(context),
        notifier.pageState == PageState.LOADING
            ? _showLoading()
            : Container(),
        Container(),
      ],
    );

  }


  Widget annotatedRegion(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        //Status bar color for android
        statusBarColor: setStatusBarColor() ?? AppInitiator.baseAppColor.mainBackgroundColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Material(
        color: AppInitiator.baseAppColor.mainBackgroundColor,
        child: pageScaffold(context),
      ),
    );
  }

  Widget pageScaffold(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset(),
      backgroundColor: AppInitiator.baseAppColor.mainBackgroundColor,
      floatingActionButton: floatingActionButton(),
      appBar: appBar(),
      body: pageContent(context),
      bottomNavigationBar: bottomNavigationBar(),
      drawer: drawer(),
    );
  }

  Widget pageContent(BuildContext context) {
    return SafeArea(
      child: body(context),
    );
  }

  Widget showErrorSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });

    return Container();
  }

  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1
    );
  }

  Color? setStatusBarColor() {
    return null;
  }

  Widget? floatingActionButton() {
    return null;
  }

  PreferredSizeWidget? appBar() {
    return null;
  }

  bool resizeToAvoidBottomInset() {
    return false;
  }

  Widget? bottomNavigationBar() {
    return null;
  }

  Widget? drawer() {
    return null;
  }

  Widget _showLoading() {
    return const Loading();
  }
}