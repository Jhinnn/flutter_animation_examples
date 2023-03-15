import 'package:flutter/material.dart';

class AnimatedSwitcherRoute extends StatefulWidget {
  const AnimatedSwitcherRoute({Key? key}) : super(key: key);

  @override
  State<AnimatedSwitcherRoute> createState() => _AnimatedSwitcherRouteState();
}

class _AnimatedSwitcherRouteState extends State<AnimatedSwitcherRoute> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedSwitcher'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: animatedSwitcherWidget(),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          setState(() {
            _count++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget animatedSwitcherWidget() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: Text(
        key: ValueKey<int>(_count),
        _count.toString(),
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
