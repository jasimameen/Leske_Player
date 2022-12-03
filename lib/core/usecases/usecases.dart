import 'package:dartz/dartz.dart';
import '../error/failure.dart';

abstract class UseCases<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// This is a generic class that can be used to pass noparameters to a use case.
class NoParams{}