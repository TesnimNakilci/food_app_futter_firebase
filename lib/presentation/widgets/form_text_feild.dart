import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../utils/color/app_colors.dart';

class FormTextField extends StatelessWidget {
  const FormTextField({
    Key? key,
    required this.formControlName,
    required this.hint,
    this.padding,
    this.maxLine,
    required this.validation,
    this.textAction,
    this.onSubmitted,
    this.onChange,
  }) : super(key: key);

  final String formControlName;
  final String hint;
  final EdgeInsetsGeometry? padding;
  final int? maxLine;
  final Map<String, String Function(Object)> validation;
  final TextInputAction? textAction;
  final void Function(FormControl<Object?>)? onSubmitted;
  final void Function(FormControl<Object?>)? onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.5),
      child: ReactiveTextField(
        onChanged: onChange,
        onSubmitted: onSubmitted ?? (control) {},
        textInputAction: textAction ?? TextInputAction.next,
        validationMessages: validation,
        formControlName: formControlName,
        decoration: InputDecoration(
          contentPadding: padding ?? const EdgeInsets.all(20),
          hintStyle: Theme.of(context).textTheme.bodyMedium,
          filled: true,
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide.none),
          fillColor: AppColors.magnolia,
        ),
        maxLines: maxLine ?? 1,
        minLines: 1,
      ),
    );
  }
}