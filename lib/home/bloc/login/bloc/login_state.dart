part of 'login_bloc.dart';

enum FormzStatus { yes, no }

class LoginState extends Equatable {
  final FormzStatus status;
  final String username;

  const LoginState({
    this.status = FormzStatus.no,
    this.username = '',
  });

  LoginState copyWith({
    FormzStatus? status,
    String? username,
  }) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
    );
  }

  @override
  List<Object> get props => [status, username];
}
