import '../../../core/config/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color? buttonBackgroundColor;
  final Widget? icon;
  final MainAxisAlignment contentAxis;
  final VoidCallback? onPressed;

  const AuthButton({
    super.key,
    this.style,
    this.buttonBackgroundColor,
    this.icon,
    required this.text,
    required this.contentAxis,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonBackgroundColor ?? AppColors.primaryColor,
          foregroundColor: AppColors.lightBackgroundColor,
          minimumSize: const Size.fromHeight(55),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: contentAxis,
          children: [
            if (icon != null) ...[
              Container(
                alignment: Alignment.centerLeft,
                child: icon,
              ),
              const SizedBox(width: 8), // Add some space between icon and text
            ],
            Text(text, style: style),
          ],
        ),
      ),
    );
  }
}
