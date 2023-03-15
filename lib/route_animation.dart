import 'package:flutter/material.dart';

class RouteAnimation extends StatefulWidget {
  const RouteAnimation({Key? key}) : super(key: key);

  @override
  State<RouteAnimation> createState() => _RouteAnimationState();
}

class _RouteAnimationState extends State<RouteAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('RouteAnimation'),
        ),
        backgroundColor: Colors.white,
        body: const Center(
          child: Text(
            'RouteAnimation',
            textScaleFactor: 2,
          ),
        ));
  }
}
