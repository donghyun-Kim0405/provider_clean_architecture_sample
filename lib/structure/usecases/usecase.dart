

import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import '../app_initiator.dart';
import 'failure.dart';


abstract class UseCase<Type, Params> {
  Logger logger = AppInitiator.logger;

  Future<Either<Failure, Type>> call(Params params);

}