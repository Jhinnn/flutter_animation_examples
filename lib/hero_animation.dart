import 'package:flutter/material.dart';

class HeroAnimation extends StatefulWidget {
  const HeroAnimation({Key? key}) : super(key: key);

  @override
  State<HeroAnimation> createState() => _HeroAnimationState();
}

class _HeroAnimationState extends State<HeroAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HeroAnimation'),
        ),
        backgroundColor: Colors.white,
        body: Center(
            child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return const HeroAnimationRoute();
              },
            ));
          },
          child: Hero(
              tag: 'img',
              child: Image.asset('assert/images/avatar.jpeg',
                  width: 100, height: 100)),
        )));
  }
}

class HeroAnimationRoute extends StatelessWidget {
  const HeroAnimationRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HeroAnimationDetail'),
        ),
        backgroundColor: Colors.white,
        body: Hero(
            tag: 'img',
            child: Image.asset('assert/images/avatar.jpeg',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width)));
  }
}
