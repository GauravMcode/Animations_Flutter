import 'package:flutter/material.dart';
import 'home_page_helper.dart';
import 'dart:math' show pi;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  late AnimationController _flipController;
  Animation<double>? _flipAnimation;

  @override
  void initState() {
    super.initState();
    // _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    // _animation = Tween<double>(begin: 0, end: -pi / 2).animate(CurvedAnimation(parent: _animationController, curve: Curves.bounceOut));
    // _animationController.forward();

    _flipController = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _flipAnimation = Tween<double>(begin: 0, end: 2 * pi).animate(
      CurvedAnimation(parent: _flipController, curve: Curves.easeInOutCubic),
    );
    _flipController.repeat();

    // if (_animationController.value == 1.0 && _flipController.value == 0.0) {
    //   print(_animation.value);
    //   _animationController.reset();
    //   _flipController.forward();
    //   _flipAnimation = Tween<double>(begin: _flipAnimation?.value ?? 0, end: _flipAnimation?.value ?? 0 + pi).animate(
    //     CurvedAnimation(parent: _flipController, curve: Curves.bounceOut),
    //   );
    // }

    // if (_flipController.value == 1.0 && _animationController.value == 0.0) {
    //   print(_flipAnimation?.value);
    //   print(_animation.value);
    //   _flipController.reset();
    //   _animationController.forward();
    //   _animation = Tween<double>(begin: _animation.value, end: _animation.value + -pi / 2).animate(
    //     CurvedAnimation(parent: _animationController, curve: Curves.bounceOut),
    //   );
    // }
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    _flipController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        body: Center(
          child: AnimatedBuilder(
              animation: _flipController,
              builder: (context, child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..rotateY(_flipAnimation?.value ?? 0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipPath(
                        clipper: CircleCustomClipper(),
                        child: Container(
                          height: 350,
                          width: 350,
                          color: Colors.yellowAccent,
                        ),
                      ),
                      ClipPath(
                        clipper: CircleCustomClipper(),
                        child: Container(
                          height: 300,
                          width: 300,
                          color: const Color.fromARGB(255, 204, 184, 7),
                        ),
                      ),
                      CustomPaint(
                        painter: SymbolCustomPainter(),
                        child: const SizedBox(
                          height: 400,
                          width: 400,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
