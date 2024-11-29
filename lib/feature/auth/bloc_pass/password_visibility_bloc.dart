import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'password_visibility_event.dart';
part 'password_visibility_state.dart';

class PasswordVisibilityBloc extends Bloc<PasswordVisibilityEvent, PasswordVisibilityState> {
  PasswordVisibilityBloc() : super(PasswordVisibilityInitial()) {
    on<TogglePasswordVisibility>((event, emit) {
      emit(state is PasswordVisible 
      ? PasswordHidden() 
      : PasswordVisible()
      );
    });
  }
}


// class PasswordVisibilityBloc
//     extends Bloc<PasswordVisibilityEvent, PasswordVisibilityState> {
//   PasswordVisibilityBloc() : super(PasswordHidden()) {
//     on<TogglePasswordVisibility>((event, emit) {
//       emit(state is PasswordVisible ? PasswordHidden() : PasswordVisible());
//     });
//   }
// }
