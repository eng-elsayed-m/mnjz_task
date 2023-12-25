import 'failures.dart';

String mapFailureToMessage(Failure failure, [String? message]) {
  switch (failure.runtimeType) {
    case ServerFailure:
    default:
      return "Server Failure";
  }
}
