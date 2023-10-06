import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/recipes_add_repository.dart';
import '../../utils/color/app_colors.dart';
import '../../utils/recipe_form_validation.dart';
import '../widgets/checkbox_row.dart';
import '../widgets/form_text_feild.dart';
import '../widgets/validation_button.dart';

class AddRecipeForm extends ConsumerStatefulWidget {
  AddRecipeForm({Key? key}) : super(key: key);

  // Replace 'assets/images/meal.png' with your actual image path

  File? imageFile;
  final ImagePicker picker = ImagePicker();

  @override
  ConsumerState<AddRecipeForm> createState() => _AddRecipeFormState();
}

class _AddRecipeFormState extends ConsumerState<AddRecipeForm> {
  @override
  Widget build(BuildContext context) {
    final FormGroup recipeForm = ref.watch(recipeFormProvider(0));

    /* String imagePath = 'https://imgv3.fotor.com/images/blog-cover-image/part-blurry-image.jpg';
    String absoluteImagePath = Directory.current.path +'/' + imagePath;
     widget.imageFile = File(absoluteImagePath);
     print("imageFile============ ${widget.imageFile}");*/

    return ReactiveForm(
      formGroup: recipeForm,
      child: Column(
        children: [
          Stack(
            children: [
              ReactiveFormConsumer(
                builder:
                    (BuildContext context, FormGroup formGroup, Widget? child) {
                  return CircleAvatar(
                    radius: 115,
                    backgroundColor: AppColors.darkGrey,
                    child: widget.imageFile != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image.file(
                              widget.imageFile!,
                              fit: BoxFit.fill,
                              height: 250,
                              width: 250,
                            ))
                        : Image.asset(
                            "assets/images/pizza.png"), //AssetImage("assets/images/pizza.png"),
                  );
                },
              ),
              Positioned(
                bottom: 16,
                right: 15,
                child: CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.darkGrey,
                    child: IconButton(
                      onPressed: () async {
                        final pickedFile = await widget.picker
                            .pickImage(source: ImageSource.gallery);
                        setState(() {
                          widget.imageFile = File(pickedFile!.path);
                        });
                      },
                      icon: const Icon(
                        Icons.add,
                        color: AppColors.magnolia,
                      ),
                    )),
              ),
            ],
          ),
          FormTextField(
            formControlName: 'name',
            hint: 'Name',
            validation: {
              'required': (error) => 'This field must not be empty',
            },
          ),
          FormTextField(
            formControlName: 'ingredients',
            hint: 'Ingredients:',
            validation: {
              'required': (error) => 'This field must not be empty',
            },
          ),
          FormTextField(
            formControlName: 'details',
            hint: 'Details..',
            maxLine: 2,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
            validation: {
              'required': (error) => 'This field must not be empty',
            },
            textAction: TextInputAction.send,
          ),
          CheckBoxRow(),
          ReactiveFormConsumer(
            builder:
                (BuildContext context, FormGroup formGroup, Widget? child) {
              return ValidationButton(
                  // text: 'Procced',
                  callback: formGroup.valid
                      ? () async {
                          recipesAddRepository(
                            imageFile: widget.imageFile,
                            name: formGroup.value['name'],
                            ingredients: formGroup.value['ingredients'],
                            details: formGroup.value['details'],
                          );
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
    );
  }
}
