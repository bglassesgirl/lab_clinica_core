sealed class AuthExceptions implements Exception {
  final String message;

  AuthExceptions({required this.message});

}

final class AuthError extends AuthExceptions {
  AuthError({required super.message});
}

final class AuthUnauthorizedException extends AuthExceptions {
  AuthUnauthorizedException() : super(message: '');
  
}