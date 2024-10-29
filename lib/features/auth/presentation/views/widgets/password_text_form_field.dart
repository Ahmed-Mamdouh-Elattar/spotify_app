import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/features/auth/presentation/managers/show_hide_password_cubit/show_and_hide_password_cubit.dart';
import 'package:spotify_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({
    super.key,
    this.passwordController,
    this.onSaved,
    this.validator,
  });
  final String? Function(String?)? validator;
  final TextEditingController? passwordController;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowAndHidePasswordCubit(),
      child: BlocBuilder<ShowAndHidePasswordCubit, bool>(
        builder: (context, state) {
          return CustomTextFormField(
            validator: validator,
            onSaved: onSaved,
            obscureText: state,
            controller: passwordController,
            hintText: "Password",
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {
                  BlocProvider.of<ShowAndHidePasswordCubit>(context)
                      .showAndHidePassword();
                },
                icon: state
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
            ),
          );
        },
      ),
    );
  }
}
