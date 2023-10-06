import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../utils/color/app_colors.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: 50,
              child: const CupertinoTextField(
                suffix: Icon(
                  Icons.search,
                  color: AppColors.darkGrey,
                  size: 25,
                ),
                placeholder: '   Search',
                placeholderStyle: TextStyle(color: AppColors.black),
                onChanged: null,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.filter_list,
            size: 40,
          ),
        ),
      ],
    );
  }
}
