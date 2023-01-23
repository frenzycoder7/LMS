import 'package:flutter/material.dart';

class HeroInput extends StatelessWidget {
  HeroInput({
    super.key,
    required this.name,
    required this.controller,
    required this.enabled,
    required this.hintText,
  });
  String name;
  TextEditingController controller;
  bool enabled;
  String hintText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Material(
        elevation: 2,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: double.infinity,
          color: Theme.of(context).bottomAppBarColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  name,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
              TextField(
                controller: controller,
                enabled: enabled,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(fontSize: 12),
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
