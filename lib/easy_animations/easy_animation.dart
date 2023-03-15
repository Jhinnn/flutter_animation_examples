import 'package:flutter/material.dart';

import 'animated_widget1.dart';
import 'animated_widget2.dart';
import 'animated_widget3.dart';

class EasyAnimation extends StatefulWidget {
  const EasyAnimation({Key? key}) : super(key: key);

  @override
  State<EasyAnimation> createState() => _EasyAnimationState();
}

class _EasyAnimationState extends State<EasyAnimation>
    with SingleTickerProviderStateMixin {
  late Animation _animation;

  late AnimationController _animationController;

  Color boxColor = Colors.black;
  Alignment alignment = Alignment.topLeft;

  // Animation 在一段时间内以此生成的一个区间之间的值的类
  late Animation<Alignment> _animationAlign;
  late Animation<Color?> _animationColor;
  late Animation<int> _animationInt;

  @override
  void initState() {
    super.initState();

    initAnimation3();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EasyAnimation'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: const [
          AnimationWidget1(),
          AnimationWidget2(),
          AnimationWidget3(),
        ],
      ),
    );
  }

  void initAnimation1() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..addListener(() {
            setState(() {
              boxColor = _animation.value;
            });
          });

    CurvedAnimation curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);

    ColorTween colorTween = ColorTween(begin: Colors.blue, end: Colors.red);
/*
   
    IntTween intTween = IntTween(begin: 0, end: 1);
    CurveTween curveTween = CurveTween(curve: Curves.bounceInOut);
    ReverseTween reverseTween = ReverseTween(Tween(begin: 0, end: 1));
    SizeTween sizeTween =
        SizeTween(begin: const Size(100, 100), end: const Size(200, 200));
    StepTween stepTween = StepTween(begin: 1, end: 5);
    RectTween rectTween = RectTween(
        begin: const Rect.fromLTWH(10, 10, 100, 100),
        end: const Rect.fromLTWH(100, 100, 200, 200));
    BorderTween borderTween = BorderTween(
        begin: Border.all(color: Colors.black, width: 2),
        end: const Border(top: BorderSide(color: Colors.red, width: 5)));
    Matrix4Tween matrix4tween =
        Matrix4Tween(begin: Matrix4.rotationX(10), end: Matrix4.rotationZ(20));
    TextStyleTween textStyleTween = TextStyleTween(
        begin: const TextStyle(fontSize: 20, color: Colors.black45),
        end: const TextStyle(fontSize: 24, color: Colors.yellow));
    AlignmentTween alignmentTween =
        AlignmentTween(begin: Alignment.bottomCenter, end: Alignment.topLeft);
    DecorationTween decorationTween = DecorationTween(
        begin: BoxDecoration(
            color: Colors.pink[300],
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.yellow)),
        end: BoxDecoration(
            color: Colors.pink[700],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.red)));

    EdgeInsetsTween edgeInsetsTween =
        EdgeInsetsTween(begin: EdgeInsets.all(20), end: EdgeInsets.all(100));
    // ShapeBorderTween shapeBorderTween = ShapeBorderTween(begin: )
    BorderRadiusTween borderRadiusTween = BorderRadiusTween(
        begin: BorderRadius.circular(10), end: BorderRadius.circular(20));
    // AlignmentGeometryTween alignmentGeometryTween = AlignmentGeometryTween(begin: AlignmentGeometry.)

    FractionalOffsetTween fractionalOffsetTween = FractionalOffsetTween(
        begin: FractionalOffset.bottomCenter, end: FractionalOffset.topLeft);

*/
    _animation = colorTween.animate(curvedAnimation);

    _animationController.forward();
  }

  void initAnimation2() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..addListener(() {
            setState(() {
              alignment = _animation.value;
            });
          });
    CurvedAnimation curvedAnimation = CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutExpo);
    AlignmentTween intTween =
        AlignmentTween(begin: Alignment.topLeft, end: Alignment.bottomRight);
    _animation = intTween.animate(curvedAnimation);
    _animationController.forward();
  }

  void initAnimation3() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..addListener(() {
            setState(() {});
          });
    CurvedAnimation curvedAnimation = CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.2, 0.8, curve: Curves.linear));

    CurvedAnimation curvedAnimation1 = CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.8, 1, curve: Curves.linear));
    AlignmentTween alignmentTween =
        AlignmentTween(begin: Alignment.topLeft, end: Alignment.bottomRight);
    ColorTween colorTween = ColorTween(begin: Colors.black, end: Colors.red);
    IntTween intTween = IntTween(begin: 0, end: 100);
    _animationAlign = alignmentTween.animate(curvedAnimation);
    _animationColor = colorTween.animate(curvedAnimation);
    _animationInt = intTween.animate(curvedAnimation1);
    _animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _animationController.dispose();
    super.dispose();
  }
}
