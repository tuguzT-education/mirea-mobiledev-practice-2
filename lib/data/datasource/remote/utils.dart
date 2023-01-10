import 'package:dartz/dartz.dart' as dartz;
import 'package:dio/dio.dart' as dio;
import 'package:todolist_flutter/domain/error.dart';
import 'package:todolist_flutter/domain/result.dart';

extension DioErrorExt on dio.DioError {
  DomainError toDomainError() {
    switch (type) {
      case dio.DioErrorType.connectTimeout:
      case dio.DioErrorType.sendTimeout:
      case dio.DioErrorType.receiveTimeout:
        return NetworkError(
          message: "Network failure of type $type",
          cause: error,
        );
      case dio.DioErrorType.response:
      case dio.DioErrorType.cancel:
        return LogicError(message: "Wrong remote API usage", cause: error);
      case dio.DioErrorType.other:
        return UnknownError(message: "Unknown error", cause: error);
    }
  }
}

extension ResponseExt<T> on dio.Response<T> {
  DomainResult<T> toDomainResult() {
    if (statusCode == null) {
      if (data == null) {
        return dartz.left(const UnknownError(message: "No data was found"));
      }
      return dartz.right(data as T);
    }
    if (statusCode! >= 200 && statusCode! <= 299) {
      return dartz.right(data as T);
    }
    return dartz.left(const LogicError(message: "Wrong remote API usage"));
  }
}
