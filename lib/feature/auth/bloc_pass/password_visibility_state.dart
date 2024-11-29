part of 'password_visibility_bloc.dart';

@immutable
sealed class PasswordVisibilityState {}

final class PasswordVisibilityInitial extends PasswordVisibilityState {}

class PasswordVisible extends PasswordVisibilityState {}

class PasswordHidden extends PasswordVisibilityState {}
