part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class ChangePhoneCodeState extends RegisterState {}

class ChangeShowPasswordState extends RegisterState {}

class SignInLoadingState extends RegisterState {}

class SignInSuccessState extends RegisterState {}

class SignInErrorState extends RegisterState {}

class SignInServerErrorState extends RegisterState {}

class NoInternetState extends RegisterState {}

class ChangeTypeUserState extends RegisterState {}


class SignUpLoadingState extends RegisterState {}

class SignUpSuccessState extends RegisterState {}

class SignUpErrorState extends RegisterState {}

class SignUpServerErrorState extends RegisterState {}