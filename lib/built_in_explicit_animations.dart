import 'package:flutter/material.dart';

class BuiltInExplicitAnimations extends StatefulWidget {
  const BuiltInExplicitAnimations({Key? key}) : super(key: key);

  @override
  State<BuiltInExplicitAnimations> createState() =>
      _BuiltInExplicitAnimationsState();
}

class _BuiltInExplicitAnimationsState extends State<BuiltInExplicitAnimations>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<Offset> _animation;
  late Animation<Decoration> _animationDecoration;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _animation = Tween(begin: const Offset(0, 400), end: const Offset(10, 200))
        .animate(_animationController);

    _animationDecoration = DecorationTween(
            begin: BoxDecoration(
                border: Border.all(width: 10, color: Colors.yellow),
                color: Colors.pink),
            end: BoxDecoration(
                border: Border.all(width: 20, color: Colors.orange),
                color: Colors.black))
        .animate(_animationController);

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('内置显示动画'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ScaleTransition(
              scale: _animationController,
              filterQuality: FilterQuality.medium,
              child: const FlutterLogo(size: 100),
            ),
            SlideTransition(
              position: _animation,
              child: const FlutterLogo(size: 100),
            ),
            RotationTransition(
                turns: _animationController,
                filterQuality: FilterQuality.high,
                child: const FlutterLogo(size: 100)),
            SizeTransition(
                sizeFactor: _animationController,
                axis: Axis.vertical,
                axisAlignment: 1.0,
                child: const FlutterLogo(size: 100)),
            FadeTransition(
              opacity: _animationController,
              child: const FlutterLogo(size: 100),
            ),
            DecoratedBoxTransition(
              decoration: _animationDecoration,
              child: const FlutterLogo(size: 100),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
