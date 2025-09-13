import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/features/auth/cubit/auth_state.dart';
import 'package:project/features/auth/data/repo/auth_repo.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInit());
  Future<void> signUp({
    required String email,
    required String name,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      final message = await AuthRepo().signUp(
        email: email,
        password: password,
        name: name,
      );
      emit(AuthSuccess(message: message));
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  Future<void> verify({required String email, required String otp}) async {
    emit(AuthLoading());
    try {
      final message = await AuthRepo().verify(email: email, otp: otp);
      emit(AuthSuccess(message: message));
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  Future<void> logIn({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final message = await AuthRepo().logIn(email: email, password: password);
      emit(AuthSuccess(message: message));
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  Future<void> forgotPassword({required String email}) async {
    emit(AuthLoading());
    try {
      final message = await AuthRepo().forgotPassword(email: email);
      emit(AuthSuccess(message: message));
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  Future<void> verifyForgotPassword({
    required String email,
    required String otp,
  }) async {
    emit(AuthLoading());
    try {
      final message = await AuthRepo().verifyForgotPassword(
        email: email,
        otp: otp,
      );
      emit(AuthSuccess(message: message));
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }
}
