import 'package:dartz/dartz.dart' as dartz;
import 'package:todolist_flutter/domain/error.dart';

typedef Result<T, E> = dartz.Either<E, T>;

typedef DomainResult<T> = Result<T, DomainError>;
