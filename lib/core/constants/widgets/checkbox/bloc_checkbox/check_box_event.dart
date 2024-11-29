part of 'check_box_bloc.dart';

@immutable
sealed class CheckBoxEvent {}

class CheckboxToggled extends CheckBoxEvent {}