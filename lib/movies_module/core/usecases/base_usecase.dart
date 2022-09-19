import 'package:clean_arch_ug/movies_module/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUseCase<T>{
  Future<Either<Failure,T>> call();
}