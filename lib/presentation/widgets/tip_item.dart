import 'package:flutter/material.dart';

import '../../utils/color/app_colors.dart';

class TipItem extends StatefulWidget {
  final String title;
  final String details;

  TipItem({
    required this.title,
    required this.details,
  });

  @override
  _TipItemState createState() => _TipItemState();
}

class _TipItemState extends State<TipItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: AppColors.magnolia,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                  overflow: TextOverflow.clip,
                ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.details,
            style: Theme.of(context).textTheme.bodySmall,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          )
        ],
      ),
    );
  }
}
