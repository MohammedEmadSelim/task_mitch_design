import 'package:either_dart/either.dart';
import 'package:mitch_designs_task/core/exceptions/failure.dart';

abstract class UseCase<Entity> {
  Future<Either<Failure, Entity>> call();
}

abstract class UseCaseWithParam<Entity, ParamEntity> {
  Future<Either<Failure, Entity>> call(ParamEntity paramEntity);
}
