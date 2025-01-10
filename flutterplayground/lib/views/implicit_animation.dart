import 'package:flutter/material.dart';

class ImplicitAnimationView extends StatefulWidget {
  const ImplicitAnimationView({super.key});

  @override
  State<ImplicitAnimationView> createState() => _ImplicitAnimationViewState();
}

const defaultWidth = 100.0;

class _ImplicitAnimationViewState extends State<ImplicitAnimationView> {
  var _isZoomedIn = false;
  var _buttonTitle = 'Zoom in';
  var _width = defaultWidth;
  var _curve = Curves.bounceOut;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Implicit Animation',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(
                  milliseconds: 200,
                ),
                width: _width,
                curve: _curve,
                child: Image.asset(
                  'images/alien.png',
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _isZoomedIn = !_isZoomedIn;
                _buttonTitle = _isZoomedIn ? 'Zoom out' : 'Zoom in';
                _width = _isZoomedIn
                    ? MediaQuery.of(context).size.width
                    : defaultWidth;
                _curve = _isZoomedIn ? Curves.bounceInOut : Curves.bounceOut;
              });
            },
            child: Text(_buttonTitle),
          ),
        ],
      ),
    );
  }
}
