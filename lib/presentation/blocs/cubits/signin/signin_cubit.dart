import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../../../repositories/repositories.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final AuthRepository _authRepository;

  SigninCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(SigninState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: SigninStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: SigninStatus.initial));
  }

  Future<void> signinWithCredentials() async {
    if (!state.isValid || state.status == SigninStatus.submitting) return;
    try {
      var user = await _authRepository.signIn(
          email: state.email, password: state.password);

      // print('Sign in user ' + user.toString());

      emit(
        state.copyWith(
          status: SigninStatus.success,
          user: user,
        ),
      );
    } catch (_) {}
  }
}
