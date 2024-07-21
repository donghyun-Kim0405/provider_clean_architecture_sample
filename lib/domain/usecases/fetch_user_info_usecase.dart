import 'package:dartz/dartz.dart';
import 'package:provider_clean_architecture/domain/repositories/user_repository.dart';

import '../../structure/usecases/failure.dart';
import '../../structure/usecases/success.dart';
import '../../structure/usecases/usecase.dart';


class FetchUserInfoUseCaseParam {
	FetchUserInfoUseCaseParam();
}

class FetchUserInfoUseCaseSuccess extends Success {
	FetchUserInfoUseCaseSuccess();
}

class FetchUserInfoUseCase extends UseCase<FetchUserInfoUseCaseSuccess, FetchUserInfoUseCaseParam> {

	final UserRepository userRepository;

	FetchUserInfoUseCase({required this.userRepository});

	@override
	Future<Either<Failure, FetchUserInfoUseCaseSuccess>> call(FetchUserInfoUseCaseParam params) async {

		return Right(FetchUserInfoUseCaseSuccess());
	}
}
