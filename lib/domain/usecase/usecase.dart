
import 'package:dartz/dartz.dart';
import '../../core/constants/app_error.dart';


abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}
