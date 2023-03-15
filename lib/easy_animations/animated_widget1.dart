import 'package:flutter/material.dart';

class AnimationWidget1 extends StatefulWidget {
  const AnimationWidget1({Key? key}) : super(key: key);

  @override
  State<AnimationWidget1> createState() => _AnimationWidget1State();
}

class _AnimationWidget1State extends State<AnimationWidget1>
    with SingleTickerProviderStateMixin {
  late Animation _animation;

  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..addListener(() {
            setState(() {});
          });
    ColorTween colorTween =
        ColorTween(begin: Colors.black, end: Colors.redAccent);
    CurvedAnimation curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    _animation = colorTween.animate(curvedAnimation);

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ClipOval(
            child: Container(
      width: 50,
      height: 50,
      color: _animation.value,
    )));
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _animationController.dispose();
    super.dispose();
  }
}
