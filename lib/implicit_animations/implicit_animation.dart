import 'package:flutter/material.dart';

class ImplicitAnimationsRoute extends StatefulWidget {
  const ImplicitAnimationsRoute({Key? key}) : super(key: key);

  @override
  State<ImplicitAnimationsRoute> createState() =>
      _ImplicitAnimationsRouteState();
}

class _ImplicitAnimationsRouteState extends State<ImplicitAnimationsRoute> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    // AnimatedContainer
    // AnimatedAlign(alignment: alignment, duration: duration)
    // AnimatedDefaultTextStyle
    // AnimatedOpacity
    // AnimatedPadding
    // AnimatedPositioned
    // AnimatedPositionedDirectional
  }

  double width = 40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('隐式动画'),
      ),
      body: Center(
          child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
        child: FlutterLogo(
          size: width,
        ),
      )),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          width = 200;
        });
      },child:const Icon(Icons.handshake)),
    );
  }
}
