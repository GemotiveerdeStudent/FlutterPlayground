import 'package:flutter/material.dart';

class TweenAnimationView extends StatefulWidget {
  const TweenAnimationView({super.key});

  @override
  State<TweenAnimationView> createState() => _TweenAnimationViewState();
}

class _TweenAnimationViewState extends State<TweenAnimationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tween Animation'),
      ),
    );
  }
}
