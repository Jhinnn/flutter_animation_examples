import 'package:flutter/material.dart';

class EasyAnimatedBuilder extends StatefulWidget {
  const EasyAnimatedBuilder({Key? key}) : super(key: key);

  @override
  State<EasyAnimatedBuilder> createState() => _EasyAnimatedBuilderState();
}

class _EasyAnimatedBuilderState extends State<EasyAnimatedBuilder>
    with SingleTickerProviderStateMixin {
  // late Animation _animation;

  late AnimationController _animationController;

  Color boxColor = Colors.black;
  Alignment alignment = Alignment.topLeft;

  // Animation 在一段时间内以此生成的一个区间之间的值的类
  late Animation<Alignment> _animationAlign;

  @override
  void initState() {
    super.initState();

    initAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedBuilder'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animationAlign,
          builder: (context, child) {
            return Align(
              alignment: _animationAlign.value,
              child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50))),
            );
          },
        ),
      ),
    );
  }

  void initAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    CurvedAnimation curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);
    _animationAlign =
        AlignmentTween(begin: Alignment.topLeft, end: Alignment.bottomRight)
            .animate(curvedAnimation);
    _animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _animationController.dispose();
    super.dispose();
  }
}
