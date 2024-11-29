import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_checkbox/check_box_bloc.dart';

class MyCheckBox extends StatelessWidget {
  final Color activeColor;
  final Color checkColor;

  const MyCheckBox(
      {super.key, required this.activeColor, required this.checkColor});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckBoxBloc(),
      child: BlocBuilder<CheckBoxBloc, CheckBoxState>(
        builder: (context, state) {
          return Checkbox(
              activeColor: activeColor,
              checkColor: checkColor,
              value: state is CheckboxChecked,
              onChanged: (value) {
                context.read<CheckBoxBloc>().add(CheckboxToggled());
                // getIt
                //     .get<SharedPreferences>()
                //     .setBool("remeberMe", value = true);
                print(value);
              });
        },
      ),
    );
  }
}
