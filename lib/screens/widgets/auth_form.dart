import "package:email_validator/email_validator.dart";
import "package:flutter/material.dart";
import "package:node_todo_app/app/config/app_colors.dart";
import "package:node_todo_app/app/config/app_paddings.dart";
import "package:node_todo_app/app/config/themes/app_text_field_themes.dart";
import 'package:node_todo_app/providers/auth_provider.dart';
import "package:node_todo_app/screens/widgets/button.dart";
import "package:provider/provider.dart";

class AuthFormField extends StatefulWidget {
  const AuthFormField({
    super.key,
    // required this.emailController,
    // required this.passwordController,
    // required this.formKey,
  });

  // final TextEditingController emailController;
  // final TextEditingController passwordController;
  // final GlobalKey formKey;

  @override
  State<AuthFormField> createState() => _AuthFormFieldState();
}

class _AuthFormFieldState extends State<AuthFormField> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isObscure = false;
  final formKey = GlobalKey<FormState>();

  void setObscureText() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        // height: size.height * 0.31,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            TextFormField(
                validator: (value) {
                  return value != null && !EmailValidator.validate(value)
                      ? "Enter a valid email "
                      : null;
                },
                controller: emailController,
                cursorColor: AppColors.textColor,
                style:
                    const TextStyle(fontSize: 16, color: AppColors.textColor),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: AppTextFieldDecorations.emailInputDecoration),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (value) {
                return value != null && value.length < 6
                    ? "Enter min 6 characters "
                    : null;
              },
              obscureText: isObscure,
              controller: passwordController,
              cursorColor: AppColors.textColor,
              style: const TextStyle(fontSize: 16, color: AppColors.textColor),
              decoration: AppTextFieldDecorations.passwordInputDecoration(
                  isObscure, setObscureText),
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            AppSizes.largeY,
            AppSizes.largeY,
            Button(
              isLoading: context.watch<AuthProvider>().loading.isLoading,
              press: () => {
                if (formKey.currentState!.validate())
                  context.read<AuthProvider>().signIn(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                      context: context),
              },
              text: "Login",
            ),
          ],
        ),
      ),
    );
  }
}
