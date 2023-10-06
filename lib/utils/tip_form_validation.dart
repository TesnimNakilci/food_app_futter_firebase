import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

final tipsFormProvider =
    Provider.family.autoDispose<FormGroup, void>((ref, __) {
  return FormGroup({
    'name': FormControl<String>(
      validators: [Validators.required],
    ),
    'details': FormControl<String>(
      validators: [Validators.required],
    ),
  });
});
