import 'dart:math';
import 'package:flutter/material.dart';

class BlueSquareRotateView extends StatefulWidget {
  const BlueSquareRotateView({super.key});

  @override
  _BlueSquareRotateViewState createState() => _BlueSquareRotateViewState();
}

class _BlueSquareRotateViewState extends State<BlueSquareRotateView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 2 * pi,
    ).animate(_controller);

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blue Square Rotate'),
      ),
      body: Center(
        child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform(
                alignment: Alignment
                    .center, // The place where it is rotating from, it's rotating alongside the middle now. ( like someone is holding it in the middle and rotating it )
                transform: Matrix4.identity()
                  ..rotateY(_animation
                      .value), // Matrix identitity is like saying offset 0.
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 5,
                        spreadRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
