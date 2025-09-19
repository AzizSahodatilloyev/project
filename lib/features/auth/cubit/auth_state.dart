abstract class AuthState {
  const AuthState();
}

class AuthInit extends AuthState {
  const AuthInit();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthSuccess extends AuthState {
  final String message;
  const AuthSuccess({required this.message});
}

class AuthError extends AuthState {
  final String error;
  const AuthError({required this.error});
}
