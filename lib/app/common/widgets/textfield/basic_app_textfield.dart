import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BasicAppTextfield extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final VoidCallback? onPressedIcon;
  final Icon? icon;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const BasicAppTextfield({
    super.key,
    this.hintText,
    this.icon,
    this.onPressedIcon,
    this.obscureText = false,
    this.labelText,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) =>
          FocusScope.of(context).unfocus(disposition: UnfocusDisposition.scope),
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        labelText: labelText,
        hintText: hintText,
        suffixIcon: icon != null
            ? Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: onPressedIcon,
                  icon: icon!,
                ),
              )
            : null,
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }
}
