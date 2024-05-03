import 'package:flutter/material.dart';
import 'package:node_todo_app/app/config/app_paddings.dart';
import 'package:node_todo_app/providers/auth_provider.dart';
import 'package:node_todo_app/screens/widgets/button.dart';
import 'package:node_todo_app/screens/widgets/auth_form.dart';
import 'package:node_todo_app/screens/widgets/sign_up_bar.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Login",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        body: SafeArea(
            child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              AppSizes.largeY,
              AppSizes.largeY,
              AppSizes.largeY,
              AuthFormField(
                  // formKey: formKey,
                  // emailController: emailController,
                  // passwordController: passwordController,
                  ),
              const Spacer(),
              SignUpBar(
                onTap: () {},
                text1: "Dont't have an account?",
                text2: "Sign up",
              ),
            ],
          ),
        )));
  }
}
