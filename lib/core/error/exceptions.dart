sealed class AppException implements Exception {
  final String message;
  AppException([this.message = 'An error occurred']);

  @override
  String toString() => message;
}

class ServerException extends AppException {
  ServerException([super.message = 'Server error occurred']);
}

class CacheException extends AppException {
  CacheException([super.message = 'Cache error occurred']);
}

class NetworkException extends AppException {
  NetworkException([super.message = 'Network error occurred']);
}

class AuthenticationException extends AppException {
  AuthenticationException([super.message = 'Authentication failed']);
}

class ValidationException extends AppException {
  ValidationException([super.message = 'Validation error']);
}

class NotFoundException extends AppException {
  NotFoundException([super.message = 'Resource not found']);
}

class UnauthorizedException extends AppException {
  UnauthorizedException([super.message = 'Unauthorized']);
}
