import 'package:flutter/material.dart';

import '../../../core/config/themes/app_colors.dart';

class ProfileButton extends StatelessWidget {
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final String text;
  final Icon leadingIcon;
  final void Function()? ontap;

  const ProfileButton({
    super.key,
    this.color,
    this.borderRadius,
    required this.text,
    required this.leadingIcon,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
        child: Row(
          children: [
            const SizedBox(width: 25),
            leadingIcon,
            const SizedBox(width: 25),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
            const SizedBox(width: 25),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.grey,
              size: 18,
            ),
            const SizedBox(
              width: 30,
            )
          ],
        ),
      ),
    );
  }
}
