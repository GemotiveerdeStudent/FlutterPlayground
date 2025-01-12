import 'package:flutter/material.dart';

class AnimatedPromptView extends StatefulWidget {
  const AnimatedPromptView({super.key});

  @override
  State<AnimatedPromptView> createState() => _AnimatedPromptViewState();
}

class _AnimatedPromptViewState extends State<AnimatedPromptView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 100,
              width: double.infinity,
            ),
            Stack(
              children: [],
            ),
          ],
        ));
  }
}
