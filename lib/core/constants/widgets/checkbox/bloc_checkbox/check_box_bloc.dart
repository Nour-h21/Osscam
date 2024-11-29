import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'check_box_event.dart';
part 'check_box_state.dart';

class CheckBoxBloc extends Bloc<CheckBoxEvent, CheckBoxState> {
  CheckBoxBloc() : super(CheckBoxInitial()) {
     on<CheckboxToggled>((event, emit) {
      emit(state is CheckboxChecked 
      ? CheckboxUnChecked() 
      : CheckboxChecked());
    });
  }
}
