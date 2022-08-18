part of 'login_bloc.dart';

enum LoginStatus { loading, success, failure }

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUsernameChanged extends LoginEvent {
  const LoginUsernameChanged({required this.username});

  final String username;

  @override
  List<Object> get props => [username];
}
