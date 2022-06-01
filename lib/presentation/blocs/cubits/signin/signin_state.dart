part of 'signin_cubit.dart';

enum SigninStatus { initial, submitting, success, error }

class SigninState extends Equatable {
  final String email;
  final String password;
  final SigninStatus status;
  final auth.User? user;

  const SigninState({
    required this.email,
    required this.password,
    required this.status,
    this.user,
  });

  factory SigninState.initial() {
    return const SigninState(
        email: '', password: '', status: SigninStatus.initial, user: null);
  }

  SigninState copyWith({
    String? email,
    String? password,
    SigninStatus? status,
    auth.User? user,
  }) {
    return SigninState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  bool get isValid => email.isNotEmpty && password.isNotEmpty;

  @override
  List<Object> get props => [email, password, status];
}
