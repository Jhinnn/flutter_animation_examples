import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationWidget3 extends StatefulWidget {
  const AnimationWidget3({Key? key}) : super(key: key);

  @override
  State<AnimationWidget3> createState() => _AnimationWidget3State();
}

class _AnimationWidget3State extends State<AnimationWidget3> {
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOut,
      width: 100,
      height: 100,
      color: Colors.red,
    );
  }
}
