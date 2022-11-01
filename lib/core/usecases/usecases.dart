import 'package:dartz/dartz.dart';
import 'package:music_player/core/error/failure.dart';

abstract class UseCases<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// This is a generic class that can be used to pass noparameters to a use case.
class NoParams{}