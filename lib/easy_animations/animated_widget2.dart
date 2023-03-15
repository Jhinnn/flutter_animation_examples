import 'package:flutter/material.dart';

class AnimationWidget2 extends StatefulWidget {
  const AnimationWidget2({Key? key}) : super(key: key);

  @override
  State<AnimationWidget2> createState() => _AnimationWidget2State();
}

class _AnimationWidget2State extends State<AnimationWidget2>
    with SingleTickerProviderStateMixin {
  late Animation _animation;
  late Animation _animationColor;
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4))
          ..addListener(() {
            setState(() {});
          });
    AlignmentTween alignmentTween =
        AlignmentTween(begin: Alignment.topLeft, end: Alignment.topRight);
    AlignmentTween alignmentTween1 =
        AlignmentTween(begin: Alignment.topRight, end: Alignment.bottomRight);
    AlignmentTween alignmentTween2 =
        AlignmentTween(begin: Alignment.bottomRight, end: Alignment.bottomLeft);
    AlignmentTween alignmentTween3 =
        AlignmentTween(begin: Alignment.bottomLeft, end: Alignment.topLeft);

    ColorTween colorTween = ColorTween(begin: Colors.black, end: Colors.red);

    CurvedAnimation curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);

    _animationColor = colorTween.animate(curvedAnimation);

    _animation = TweenSequence([
      TweenSequenceItem(tween: alignmentTween, weight: 20),
      TweenSequenceItem(tween: alignmentTween1, weight: 20),
      TweenSequenceItem(tween: alignmentTween2, weight: 20),
      TweenSequenceItem(tween: alignmentTween3, weight: 20),
    ]).animate(curvedAnimation);

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: _animation.value,
      child: ClipOval(
        child: Container(
          width: 50,
          height: 50,
          color: _animationColor.value,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _animationController.dispose();
    super.dispose();
  }
}
