import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      color: Colors.grey.shade300,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
