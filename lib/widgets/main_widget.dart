import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({
    super.key,
    required this.icon,
    required this.title,
  });
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: const TextStyle(color: primaryColor,fontSize: 18),
          ),
          const SizedBox(width: 10),
          Icon(
            icon,
            color: primaryColor,
            size: 28,
          ),
        ],
      ),
    );
  }
}
