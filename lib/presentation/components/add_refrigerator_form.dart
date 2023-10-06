import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../data/refrigerator_add_repository.dart';
import '../../utils/color/app_colors.dart';
import '../../utils/refrigerator_form_validation.dart';
import '../widgets/form_text_feild.dart';
import '../widgets/validation_button.dart';

class AddRefrigeratorForm extends ConsumerStatefulWidget {
  AddRefrigeratorForm({Key? key}) : super(key: key);
  File? imageFile;
  final ImagePicker picker = ImagePicker();

  @override
  ConsumerState<AddRefrigeratorForm> createState() =>
      _AddRefrigeratorFormState();
}

class _AddRefrigeratorFormState extends ConsumerState<AddRefrigeratorForm> {
  @override
  Widget build(BuildContext context) {
    final FormGroup refigeratorForm = ref.watch(refrigeratorFormProvider(0));

    return ReactiveForm(
      formGroup: refigeratorForm,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    ReactiveFormConsumer(
                      builder: (BuildContext context, FormGroup formGroup,
                          Widget? child) {
                        return Container(
                          height: 56,
                          width: 56,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: AppColors.avatar,
                            child: IconButton(
                              onPressed: () async {
                                final pickedFile = await widget.picker
                                    .pickImage(source: ImageSource.gallery);
                                setState(() {
                                  widget.imageFile = File(pickedFile!.path);
                                });
                              },
                              icon: widget.imageFile != null
                                  ? ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                      child: Image.file(
                                        widget.imageFile!,
                                        fit: BoxFit.fill,
                                        height: 50,
                                        width: 50,
                                      ))
                                  : Image.asset("assets/images/tomato.png"),
                            ),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      bottom: 2,
                      right: 1,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.darkGrey,
                        ),
                        child: IconButton(
                            onPressed: () async {
                              final pickedFile = await widget.picker
                                  .pickImage(source: ImageSource.gallery);
                              setState(() {
                                widget.imageFile = File(pickedFile!.path);
                              });
                            },
                            icon: Image.asset(
                              "assets/images/add_image.png",
                              fit: BoxFit.cover,
                              height: 120,
                              width: 120,
                            )),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: FormTextField(
                    formControlName: 'name',
                    hint: 'Name',
                    validation: {
                      'required': (error) => 'The name must not be empty',
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: FormTextField(
                    formControlName: 'purchaseDate',
                    hint: 'Purchase Date',
                    validation: {
                      'required': (error) => 'Must not be empty',
                      'pattern': (error) => 'Must be yyyy-mm-dd',
                    },
                  ),
                ),
                Expanded(
                    child: FormTextField(
                  formControlName: 'expirationDate',
                  hint: 'Expiration Date',
                  validation: {
                    'required': (error) => 'Must not be empty',
                    'pattern': (error) => 'Must be yyyy-mm-dd',
                  },
                ))
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: FormTextField(
                    formControlName: 'quantity',
                    hint: 'Quantity ',
                    validation: {
                      'required': (error) => 'Must not be empty',
                      'number': (error) => 'Must be number',
                    },
                  ),
                ),
                Expanded(
                    child: FormTextField(
                  formControlName: 'unit',
                  hint: 'Unit',
                  validation: {'required': (error) => 'Must not be empty'},
                ))
              ],
            ),
            FormTextField(
              formControlName: 'marketName',
              hint: 'Market Name',
              validation: {
                'required': (error) => 'The market must not be empty'
              },
            ),
            FormTextField(
              formControlName: 'notes',
              hint: 'notes ..',
              maxLine: 3,
              padding:
                  EdgeInsets.only(top: 90, bottom: 30, left: 20, right: 20),
              validation: {
                'required': (error) => 'The notes must not be empty'
              },
              textAction: TextInputAction.send,
            ),
            ReactiveFormConsumer(
              builder:
                  (BuildContext context, FormGroup formGroup, Widget? child) {
                return ValidationButton(
                    // text: "Procced",
                    callback: formGroup.valid
                        ? () async {
                            refrigeratorAddRepository(
                                imageFile: widget.imageFile,
                                name: formGroup.value['name'],
                                purchaseDate: formGroup.value['purchaseDate'],
                                expirationDate:
                                    formGroup.value['expirationDate'],
                                quantity: formGroup.value['quantity'],
                                unit: formGroup.value['unit'],
                                marketName: formGroup.value['marketName'],
                                notes: formGroup.value['notes']);
                            showDialog(
                              context: context,
                              builder: (context) {
                                Future.delayed(Duration(seconds: 2), () {
                                  Navigator.of(context).pop(true);
                                });
                                return const AlertDialog(
                                  content: Text(
                                      "Data added to Firestore successfully!"),
                                );
                              },
                            );
                            print(" ${formGroup.value}");
                            try {} catch (e) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  Future.delayed(Duration(seconds: 2), () {
                                    Navigator.of(context).pop(true);
                                  });
                                  return const AlertDialog(
                                    content:
                                        Text("Error adding data to Firestore"),
                                  );
                                },
                              );
                            }
                          }
                        : null);
              },
            )
          ],
        ),
      ),
    );
    ;
  }
}
