import 'package:flutter/material.dart';

class ListItemWidget extends StatelessWidget {
  final String title;
  final Color color;

  const ListItemWidget({
    super.key,
    this.color = Colors.cyan,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.arrow_right,
          size: 36,
          color: color,
        ),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
