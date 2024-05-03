import 'package:flutter/material.dart';
import 'package:node_todo_app/app/config/app_colors.dart';
import 'package:node_todo_app/app/config/app_paddings.dart';
import 'package:node_todo_app/core/extensions/sizes_extensions.dart';

class SignUpBar extends StatelessWidget {
  const SignUpBar({
    super.key,
    required this.text1,
    required this.text2,
    required this.onTap,
  });

  final String text1;
  final String text2;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.w,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textColor,
                ),
          ),
          AppSizes.smallX,
          GestureDetector(
            onTap: onTap,
            child: Text(
              text2,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    decoration: TextDecoration.underline,
                    color: AppColors.secondaryColor,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
