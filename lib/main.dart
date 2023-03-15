import 'package:flutter/material.dart';
import 'package:flutter_animation_examples/built_in_explicit_animations.dart';
import 'package:flutter_animation_examples/easy_animations/easy_animation.dart';
import 'package:flutter_animation_examples/animated_builder.dart';
import 'package:flutter_animation_examples/hero_animation.dart';
import 'package:flutter_animation_examples/interlace_animation.dart';

import 'animated_switcher.dart';
import 'implicit_animations/implicit_animation.dart';
import 'implicit_animations/tween_animation_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation',
      theme: ThemeData(primarySwatch: Colors.cyan, useMaterial3: true),
      home: const AnimationsMenu(),
    );
  }
}

class AnimationsMenu extends StatelessWidget {
  const AnimationsMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Example'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            AnimationCard(
              tap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ImplicitAnimationsRoute(),
              )),
              title: 'Implicit animations',
              subTitle:
                  'AnimatedContainer, AnimatedCrossFade, AnimatedDefaultTextStyle, AnimatedModalBarrier, AnimatedOpacity, AnimatedPadding, AnimatedPhysicalModel, AnimatedPositioned, AnimatedPositionedDirectional, AnimatedSwitcher',
            ),
            AnimationCard(
              tap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const TweenAnimationBuilderRoute(),
              )),
              title: 'TweenAnimationBuilder',
              subTitle: 'TweenAnimationBuilder',
            ),
            AnimationCard(
              tap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const BuiltInExplicitAnimations(),
              )),
              title: 'Built-in explicit animations',
              subTitle:
                  'ScaleTransition、RotationTransition、SizeTransition、DecoratedBoxTransition',
            ),
            AnimationCard(
              tap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const EasyAnimation(),
              )),
              title: 'Animation',
              subTitle:
                  'Animation、AnimationController、CurvedAnimation、Tween、ColorTween、TweenSequence、TweenSequenceItem',
            ),
            AnimationCard(
              tap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const EasyAnimatedBuilder(),
              )),
              title: 'AnimatedBuilder',
              subTitle: 'AnimatedBuilder',
            ),
            AnimationCard(
              tap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const InterlaceAnimationRoute(),
              )),
              title: 'Interlace Animation',
              subTitle: 'AnimatedBuilder、Interval',
            ),
            AnimationCard(
              tap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const InterlaceAnimationRoute(),
              )),
              title: 'Route Animation',
              subTitle: 'PageRouteBuilder FadeTransition',
            ),
            AnimationCard(
              tap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const HeroAnimation(),
              )),
              title: 'Hero Animation',
              subTitle: 'Hero tag',
            ),
            AnimationCard(
              tap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AnimatedSwitcherRoute(),
              )),
              title: 'AnimatedSwitcher',
              subTitle: 'key: ValueKey<int>(_count)',
            ),
          ],
        ),
      ),
    );
  }
}

class AnimationCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function() tap;
  const AnimationCard(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.tap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Card(
        elevation: 12,
        shadowColor: Colors.purple[400],
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
              const SizedBox(
                height: 12
              ),
              Text(
                subTitle,
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                maxLines: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
