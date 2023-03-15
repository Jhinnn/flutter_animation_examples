import 'package:flutter/material.dart';

class InterlaceAnimationRoute extends StatefulWidget {
  const InterlaceAnimationRoute({super.key});

  @override
  State<InterlaceAnimationRoute> createState() =>
      _InterlaceAnimationRouteState();
}

class _InterlaceAnimationRouteState extends State<InterlaceAnimationRoute>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('EasyAnimation'),
        ),
        body: InterlaceAnimation(controller: _animationController));
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _animationController.dispose();
    super.dispose();
  }
}

class InterlaceAnimation extends StatelessWidget {
  InterlaceAnimation({Key? key, required this.controller}) : super(key: key) {
    opacity = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 0.5, curve: Curves.linear)));
    color = ColorTween(begin: Colors.yellow, end: Colors.pink).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.5, curve: Curves.linear)));
    padding = Tween<EdgeInsets>(
            begin: const EdgeInsets.only(left: 0),
            end: const EdgeInsets.only(left: 300))
        .animate(CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 1, curve: Curves.linear)));
  }

  late final Animation<double> opacity;
  late final Animation<Color?> color;
  late final Animation<double> controller;
  late final Animation<EdgeInsets> padding;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          padding: padding.value,
          child: Opacity(
              opacity: opacity.value,
              child: Container(width: 100, height: 100, color: color.value)),
        );
      },
    );
  }
}
