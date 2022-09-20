import 'package:clean_arch_ug/movies_module/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class BaseUseCase<T ,  Parameters>{
  Future<Either<Failure,T>> call(Parameters parameters);
}

class NoParameters extends Equatable{

  @override
  List<Object?> get props => [];

  const NoParameters();
}