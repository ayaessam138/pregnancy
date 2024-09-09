part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSucess extends LoginState {}

class Logingloading extends LoginState {}

class LoginFail extends LoginState {
  String errorMessage;
  LoginFail({required this.errorMessage});
}

class GetRoleSucess extends LoginState {
  String? userrole;
  GetRoleSucess({required this.userrole});
}

class GetRoleloading extends LoginState {}
