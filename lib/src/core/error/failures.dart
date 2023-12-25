import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class OfflineFailure extends Failure {
  OfflineFailure();
}

class ServerFailure extends Failure {
  final String message;

  ServerFailure(this.message);
}
