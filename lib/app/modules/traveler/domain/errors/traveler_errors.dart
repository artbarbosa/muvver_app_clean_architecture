import '../../../../core/shared/failures/failures.dart';

abstract class TravelerError implements Failure {}

class TravelerInvalid extends TravelerError {}

class TravelerDatasourceInternetConnection implements NoInternetConnection {}

class TravelerDatasourceError extends Failure {
  TravelerDatasourceError({
    StackTrace? stackTrace,
    required String label,
    required dynamic exception,
    required String errorMessage,
  }) : super(
          stackTrace: stackTrace,
          errorMessage: errorMessage,
        );
}

class TravelerRepositoryError extends Failure {
  TravelerRepositoryError({
    StackTrace? stackTrace,
    required String label,
    required dynamic exception,
    required String errorMessage,
  }) : super(
          stackTrace: stackTrace,
          errorMessage: errorMessage,
        );
}
