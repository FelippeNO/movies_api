import 'package:flutter/material.dart';

class CoreException implements Exception {
  CoreException(StackTrace? stackTrace, String? label, dynamic exception) {
    debugPrintStack(label: 'Exception :: $label', stackTrace: stackTrace);
  }
}

class GetBadRequisitionException extends CoreException {
  GetBadRequisitionException(StackTrace stackTrace, String label, exception) : super(stackTrace, label, exception);
}

class GetFromCacheException extends CoreException {
  GetFromCacheException(StackTrace stackTrace, String label, exception) : super(stackTrace, label, exception);
}

class SaveToCacheException extends CoreException {
  SaveToCacheException(super.stackTrace, super.label, super.exception);
}

class JsonParsingException extends CoreException {
  JsonParsingException(super.stackTrace, super.label, super.exception);
}
