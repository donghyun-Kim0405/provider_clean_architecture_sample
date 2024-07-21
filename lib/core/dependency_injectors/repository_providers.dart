
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider_clean_architecture/core/configs/app_build_config.dart';
import 'package:provider_clean_architecture/data/mock/mock_auth_repository.dart';
import 'package:provider_clean_architecture/data/mock/mock_user_repository.dart';
import 'package:provider_clean_architecture/data/repositories/auth_repository_impl.dart';
import 'package:provider_clean_architecture/data/repositories/user_repository_impl.dart';
import 'package:provider_clean_architecture/domain/repositories/auth_repository.dart';
import 'package:provider_clean_architecture/domain/repositories/user_repository.dart';
import 'package:provider_clean_architecture/structure/app_initiator.dart';
import 'package:provider_clean_architecture/structure/network/dio_injector.dart';

List<SingleChildWidget> repositoryProviders = [

  Provider<UserRepository>(
    create: (context) {

      final Dio dio = DioInjector.createDioWithoutToken();

      final String baseUrl = "${BuildConfig.instance.baseUrl}/user/";

      dio.options = dio.options.copyWith(baseUrl: baseUrl);

      return BuildConfig.instance.usingMockRepository
          ? MockUserRepository()
          : UserRepositoryImpl(dio: dio);
    },
  ),

  Provider<AuthRepository>(
      create: (context) {

        final Dio dio = DioInjector.createDioWithoutToken();

        final String baseUrl = "${BuildConfig.instance.baseUrl}/auth/";

        dio.options = dio.options.copyWith(baseUrl: baseUrl);

        return BuildConfig.instance.usingMockRepository
            ? MockAuthRepository()
            : AuthRepositoryImpl(dio: dio);
      },
  )





];