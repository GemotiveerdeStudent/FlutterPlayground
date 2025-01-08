import 'dart:math' show pi;
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class ThreeDimensionalAnimationView extends StatefulWidget {
  const ThreeDimensionalAnimationView({super.key});

  @override
  State<ThreeDimensionalAnimationView> createState() =>
      _ThreeDimensionalAnimationViewState();
}

const widthAndHeight = 100.0; // Standard value for containers.

class _ThreeDimensionalAnimationViewState
    extends State<ThreeDimensionalAnimationView> with TickerProviderStateMixin {
  late AnimationController _xController;
  late AnimationController _yController;
  late AnimationController _zController;
  late Tween<double> _animation;

  @override
  void initState() {
    super.initState();

    _xController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 20,
      ),
    );

    _zController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 30,
      ),
    );

    _yController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 40,
      ),
    );

    _animation = Tween<double>(
      // Tween means BETWEEN. It's a range of values.
      begin: 0,
      end: pi * 2,
    );
  }

  @override
  void dispose() {
    _xController.dispose();
    _yController.dispose();
    _zController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _xController
      ..reset()
      ..repeat();

    _yController
      ..reset()
      ..repeat();

    _zController
      ..reset()
      ..repeat();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: widthAndHeight,
              width: double.infinity,
            ),
            AnimatedBuilder(
              animation: Listenable.merge([
                _xController,
                _yController,
                _zController,
              ]),
              builder: (context, child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateX(_animation.evaluate(_xController))
                    ..rotateY(_animation.evaluate(_yController))
                    ..rotateZ(_animation.evaluate(_zController)),
                  child: Stack(
                    children: [
                      //front
                      Container(
                        color: const Color.fromARGB(255, 238, 23, 8),
                        width: widthAndHeight,
                        height: widthAndHeight,
                      ),
                      // top side
                      Transform(
                        alignment: Alignment.topCenter,
                        transform: Matrix4.identity()..rotateX(-pi / 2),
                        child: Container(
                          color: const Color.fromARGB(255, 187, 13, 149),
                          width: widthAndHeight,
                          height: widthAndHeight,
                        ),
                      ),
                      // bottom side
                      Transform(
                        alignment: Alignment.bottomCenter,
                        transform: Matrix4.identity()..rotateX(pi / 2),
                        child: Container(
                          color: const Color.fromARGB(255, 184, 108, 9),
                          width: widthAndHeight,
                          height: widthAndHeight,
                        ),
                      ),
                      // left side
                      Transform(
                        alignment: Alignment.centerLeft,
                        transform: Matrix4.identity()..rotateY(pi / 2),
                        child: Container(
                          color: const Color.fromARGB(255, 47, 187, 13),
                          width: widthAndHeight,
                          height: widthAndHeight,
                        ),
                      ),
                      // right side
                      Transform(
                        alignment: Alignment.centerRight,
                        transform: Matrix4.identity()..rotateY(-pi / 2),
                        child: Container(
                          color: const Color.fromARGB(255, 18, 21, 189),
                          width: widthAndHeight,
                          height: widthAndHeight,
                        ),
                      ),
                      // back
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..translate(Vector3(0, 0, -widthAndHeight)),
                        child: Container(
                          color: const Color.fromARGB(255, 218, 204, 19),
                          width: widthAndHeight,
                          height: widthAndHeight,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
