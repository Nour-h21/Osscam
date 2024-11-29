part of 'check_box_bloc.dart';

@immutable
sealed class CheckBoxState {}

final class CheckBoxInitial extends CheckBoxState {}

class CheckboxChecked extends CheckBoxState {}

class CheckboxUnChecked extends CheckBoxState {}