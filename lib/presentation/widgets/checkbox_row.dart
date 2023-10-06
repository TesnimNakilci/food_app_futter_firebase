import 'package:flutter/material.dart';
import 'package:food_app_flutter/utils/color/app_colors.dart';

class CheckBoxRow extends StatefulWidget {
  const CheckBoxRow({Key? key}) : super(key: key);

  @override
  _CheckBoxRowState createState() => _CheckBoxRowState();
}

class _CheckBoxRowState extends State<CheckBoxRow> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return AppColors.magnolia;
    }
    return Row(
      children: [
        Transform.scale(
        scale: 1.8,
        child: Checkbox(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6)),
        checkColor:AppColors.checkboxColor,
        fillColor: MaterialStateProperty.resolveWith(getColor),
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
        },
    ),
      ),
        Text("Share recip with community", style: Theme.of(context).textTheme.bodyLarge,)
      ],
    );
  }
}
