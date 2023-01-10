import 'package:dartz/dartz.dart';

import 'error.dart';

typedef Result<T, E> = Either<E, T>;

typedef DomainResult<T> = Result<T, DomainError>;
