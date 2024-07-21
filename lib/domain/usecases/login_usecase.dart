import 'package:dartz/dartz.dart';
import 'package:provider_clean_architecture/domain/repositories/auth_repository.dart';
import 'package:provider_clean_architecture/domain/repositories/user_repository.dart';

import '../../structure/usecases/failure.dart';
import '../../structure/usecases/success.dart';
import '../../structure/usecases/usecase.dart';


class LoginUseCaseParam {
  final String email;
  final String pwd;
	LoginUseCaseParam({
    required this.email,
    required this.pwd
  });
}

class LoginUseCaseSuccess extends Success {
	LoginUseCaseSuccess();
}

class LoginUseCase extends UseCase<LoginUseCaseSuccess, LoginUseCaseParam> {

  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  @override
	Future<Either<Failure, LoginUseCaseSuccess>> call(LoginUseCaseParam params) async {

		return Right(LoginUseCaseSuccess());
	}
}
