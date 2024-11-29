part of 'password_visibility_bloc.dart';

@immutable
sealed class PasswordVisibilityEvent {}

class TogglePasswordVisibility extends PasswordVisibilityEvent {}
