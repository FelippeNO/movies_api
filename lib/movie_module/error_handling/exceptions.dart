import '../../core_module/error_handling/core_exception.dart';

class GetMovieByIdException extends CoreException {
  GetMovieByIdException(super.stackTrace, super.label, super.exception);
}

class GetMoviesSnapshotException extends CoreException {
  GetMoviesSnapshotException(super.stackTrace, super.label, super.exception);
}
