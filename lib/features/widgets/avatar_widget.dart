import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final String name;
  final Color color;
  const AvatarWidget({Key? key, required this.name, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 27,
      width: 27,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: color),
      child: Center(
        child: Text(
          name,
          style: const TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}