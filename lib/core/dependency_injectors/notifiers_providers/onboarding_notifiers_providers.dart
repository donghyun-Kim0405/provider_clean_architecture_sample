import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider_clean_architecture/domain/repositories/auth_repository.dart';
import 'package:provider_clean_architecture/domain/repositories/user_repository.dart';
import 'package:provider_clean_architecture/domain/usecases/fetch_test_data_usecase.dart';
import 'package:provider_clean_architecture/domain/usecases/login_usecase.dart';
import 'package:provider_clean_architecture/presentation/notifiers/home/home_notifier.dart';

import '../../../domain/usecases/fetch_user_info_usecase.dart';
import '../../../presentation/notifiers/onboarding/login_notifier.dart';
import '../../../presentation/notifiers/onboarding/splash_notifier.dart';

List<SingleChildWidget> onBoardingNotifierProviders = [

  ChangeNotifierProvider(
    create: (context) {
      final UserRepository userRepository = context.read<UserRepository>();

      final FetchUserInfoUseCase fetchUserInfoUseCase = FetchUserInfoUseCase(userRepository: userRepository);

      return SplashNotifier(
        fetchUserInfoUseCase: fetchUserInfoUseCase
      );
    },
  ),

  ChangeNotifierProvider(
    create: (context) {

      final AuthRepository authRepository = context.read<AuthRepository>();

      final LoginUseCase loginUseCase = LoginUseCase(authRepository: authRepository);

      return LoginNotifier(loginUseCase: loginUseCase);
    },
  ),

  ChangeNotifierProvider(
    create: (context) {

      final FetchTestDataUseCase fetchTestDataUseCase = FetchTestDataUseCase();

      return HomeNotifier(fetchTestDataUseCase: fetchTestDataUseCase);
    },
  )




];