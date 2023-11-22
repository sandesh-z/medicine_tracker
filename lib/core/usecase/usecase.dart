import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UsecaseStream<FailureType, Type, Params> {
  Stream<Either<FailureType, Type>> call(Params params);
}

abstract class Usecase<FailureType, Type, Params> {
  Future<Either<FailureType, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
