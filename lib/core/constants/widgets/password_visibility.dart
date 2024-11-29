import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osscam_project/feature/auth/bloc_pass/password_visibility_bloc.dart';

import '../colors/colors.dart';

class MyPasswordVisibility extends StatelessWidget {
  const MyPasswordVisibility({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordVisibilityBloc(),
      child: BlocBuilder<PasswordVisibilityBloc, PasswordVisibilityState>(
        builder: (context, state) {
          return TextField(
            obscureText: state is PasswordVisible,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  state is PasswordHidden
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 20,
                  color: AppColors().primary,
                ),
                onPressed: () {
                  context.read<PasswordVisibilityBloc>().add(
                        TogglePasswordVisibility(),
                      );
                },
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          );
        },
      ),
    );
  }
}
