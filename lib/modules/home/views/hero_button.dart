import 'package:flutter/material.dart';

class HeroButton extends StatelessWidget {
  HeroButton({
    super.key,
    required this.onTap,
    required this.name,
    required this.icon,
  });
  Function onTap;
  String name;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
