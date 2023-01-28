import 'package:bloc_skeleton/domain/models/common/error_type.dart';

class ErrorDto {
  String message;
  ErrorType errorType;

  ErrorDto({
    required this.message,
    this.errorType = ErrorType.unknown,
  });
}
