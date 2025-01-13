import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

class TweenAnimationView extends StatefulWidget {
  const TweenAnimationView({super.key});

  @override
  State<TweenAnimationView> createState() => _TweenAnimationViewState();
}

class CircleClipper extends CustomClipper<Path> {
  const CircleClipper(); //cstr

  @override
  Path getClip(Size size) {
    var path = Path();

    final rect = Rect.fromCircle(
      // Create a circle inside of the rectangle
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );

    path.addOval(rect);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/*
0xFFFFFFFF
A R G B = 32 bits
    A = Alpha (0-255) = 8 bits (Visibility of the colour)
    R = Red (0-255) = 8 bits
    G = Green (0-255) = 8 bits
    B = Blue (0-255) = 8 bits
*/
Color getRandomColor() => Color(
      0xFF000000 +
          math.Random().nextInt(
            0x00FFFFFF,
          ),
    );

class _TweenAnimationViewState extends State<TweenAnimationView> {
  var _color = getRandomColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tween Animation'),
      ),
      body: Center(
        child: ClipPath(
          clipper: CircleClipper(),
          child: TweenAnimationBuilder(
            tween: ColorTween(
              begin: getRandomColor(),
              end: _color,
            ),
            onEnd: () {
              setState(() {
                _color = getRandomColor();
              });
            },
            duration: const Duration(seconds: 1),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.blue,
            ),
            builder: (context, Color? color, child) {
              return ColorFiltered(
                colorFilter: ColorFilter.mode(
                  color!,
                  BlendMode.srcATop,
                ),
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }
}
