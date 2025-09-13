abstract class AuthState {
  // final bool isLoading;
  // final String? error;
  // final String? message;

  // AuthState({this.isLoading = false, this.error, this.message});

  // AuthState copyWith({bool? isLoading, String? error, String? message}) {
  //   return AuthState(
  //     isLoading: isLoading ?? this.isLoading,
  //     error: error ,
  //     message: message ,
  //   );
  // }
}

class AuthInit extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String message;
  AuthSuccess({required this.message});
}

class AuthError extends AuthState {
  final String error;
  AuthError({required this.error});
}
