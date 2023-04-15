import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

class CustomTextField extends StatefulWidget {
  final bool isFilled;
  final Color? fillColor;
  final String? hintText;
  final Widget? leading;
  final Widget? trailing;
  final bool isPassword;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final double borderRadius;
  const CustomTextField({
    super.key,
    this.isFilled = true,
    this.fillColor,
    this.hintText,
    this.leading,
    this.trailing,
    this.isPassword = false,
    this.keyboardType,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.borderRadius = 4,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool hasShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        obscureText: widget.isPassword ? hasShowPassword : false,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        controller: widget.controller,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black,height: 1.8),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey.shade700,height: 2),
          contentPadding: [16, 12].horizontalAndVerticalP,
          filled: widget.isFilled,
          fillColor: widget.fillColor ?? Theme.of(context).scaffoldBackgroundColor,
          border: border,
          focusedBorder: focusBorder,
          enabledBorder: border,
          prefixIcon: widget.leading,
          suffixIcon: passwordTrailingWidget(),
        ),
      ),
    );
  }

  Widget? passwordTrailingWidget() {
    if (widget.isPassword) {
      return IconButton(
        icon: Icon(hasShowPassword ? Icons.visibility : Icons.visibility_off),
        onPressed: () => setState(() => hasShowPassword = !hasShowPassword),
        tooltip: hasShowPassword ? "Göster" : "Gizle",
      );
    }
    return widget.trailing;
  }

  OutlineInputBorder get border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        borderSide: BorderSide(color: Colors.grey.shade700, width: 0.6),
      );

  OutlineInputBorder get focusBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        borderSide: BorderSide(color: Colors.grey.shade700, width: 1),
      );
}
