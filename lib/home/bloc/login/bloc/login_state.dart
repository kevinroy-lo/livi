part of 'login_bloc.dart';

enum FormzStatus { yes, no }

class LoginState {
  final FormzStatus status;
  final String username;

  const LoginState({
    this.status = FormzStatus.no,
    this.username = '',
  });
}
