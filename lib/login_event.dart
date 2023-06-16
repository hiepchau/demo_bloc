abstract class LoginEvent {}

class LoginStart extends LoginEvent {
  final String email;
  final String password;

  LoginStart({required this.email, required this.password});
}
