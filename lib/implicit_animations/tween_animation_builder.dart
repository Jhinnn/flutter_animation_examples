import 'package:flutter/material.dart';

class TweenAnimationBuilderRoute extends StatefulWidget {
  const TweenAnimationBuilderRoute({Key? key}) : super(key: key);

  @override
  State<TweenAnimationBuilderRoute> createState() =>
      _TweenAnimationBuilderRouteState();
}

class _TweenAnimationBuilderRouteState
    extends State<TweenAnimationBuilderRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TweenAnimationBuilder'),
      ),
      body: Center(
          child: TweenAnimationBuilder(
        tween: ColorTween(begin: Colors.white, end: const Color.fromARGB(255, 5, 130, 232)),
        duration: const Duration(seconds: 5),
        curve: Curves.easeIn,
        builder: (context, Color? color, child) {
          return ColorFiltered(
            colorFilter: ColorFilter.mode(color!, BlendMode.modulate),
            child: Image.asset('assets/images/waxberry.png'),
          );
        },
      )),
    );
  }
}
