import '../../core_module/error_handling/core_exception.dart';

class GetMovieByIdException extends CoreException {
  GetMovieByIdException(super.stackTrace, super.label, super.exception);
}

class GetMoviesSnapshotException extends CoreException {
  GetMoviesSnapshotException(super.stackTrace, super.label, super.exception);
}

class GetCachedMovieByIdException extends CoreException {
  GetCachedMovieByIdException(super.stackTrace, super.label, super.exception);
}

class SaveMovieByIdToCacheException extends CoreException {
  SaveMovieByIdToCacheException(super.stackTrace, super.label, super.exception);
}

class GetCachedMoviesSnapshotException extends CoreException {
  GetCachedMoviesSnapshotException(super.stackTrace, super.label, super.exception);
}

class SaveCachedMoviesSnapshotException extends CoreException {
  SaveCachedMoviesSnapshotException(super.stackTrace, super.label, super.exception);
}
