import 'package:flutter/material.dart';

class AnimatedPromptView extends StatefulWidget {
  const AnimatedPromptView({super.key});

  @override
  State<AnimatedPromptView> createState() => _AnimatedPromptViewState();
}

class AnimatedPrompt extends StatefulWidget {
  final String title;
  final String subTitle;
  final Widget child;

  const AnimatedPrompt({
    super.key,
    required this.title,
    required this.subTitle,
    required this.child,
  });

  @override
  State<AnimatedPrompt> createState() => _AnimatedPromptState();
}

class _AnimatedPromptState extends State<AnimatedPrompt>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _iconScaleAnimation;
  late Animation<double> _containerScaleAnimation;
  late Animation<Offset> _yDisplacementAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1),
    );

    _yDisplacementAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -0.23),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _AnimatedPromptViewState extends State<AnimatedPromptView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Animated Prompt'),
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
