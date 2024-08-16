import '../../../core/config/themes/app_colors.dart';
import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final TextStyle? style;
  final double? height;
  final Color? backgroundColor;
  final OutlinedBorder? shape;

  const BasicAppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.style,
    this.height,
    this.backgroundColor,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 80),
        foregroundColor: Colors.white,

        // shadowColor: Colors.transparent,
        disabledBackgroundColor: AppColors.grey,
        backgroundColor: backgroundColor,
        shape: shape,
      ),
      child: Text(
        title,
        style: style,
      ),
    );
  }
}
