import 'package:dartz/dartz.dart';
import 'package:provider_clean_architecture/core/utils/faker_util.dart';

import '../../structure/usecases/failure.dart';
import '../../structure/usecases/success.dart';
import '../../structure/usecases/usecase.dart';


class FetchTestDataUseCaseParam {
	FetchTestDataUseCaseParam();
}

class FetchTestDataUseCaseSuccess extends Success {
  final String testMessage;
	FetchTestDataUseCaseSuccess({required this.testMessage});
}

class FetchTestDataUseCase extends UseCase<FetchTestDataUseCaseSuccess, FetchTestDataUseCaseParam> {

	@override
	Future<Either<Failure, FetchTestDataUseCaseSuccess>> call(FetchTestDataUseCaseParam params) async {
    await Future.delayed(Duration(seconds: 1));

		return Right(FetchTestDataUseCaseSuccess(
      testMessage: FakerUtil.content
    ));
	}
}
