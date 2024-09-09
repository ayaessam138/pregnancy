part of 'signup_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class Registerloading extends RegisterState {}

class Registersucess extends RegisterState {}
class SaveUserType extends RegisterState {}

class Registerfail extends RegisterState {
  String errorMessage;
  Registerfail({required this.errorMessage});
}
