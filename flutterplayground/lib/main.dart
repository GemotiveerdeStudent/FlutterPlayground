import 'package:flutterplayground/views/animated_prompt.dart';
import 'package:flutterplayground/views/custom_painter_polygon.dart';
import 'package:flutterplayground/views/three_dimensional_drawer.dart';

import 'constants/routes.dart';
import 'package:flutter/material.dart';
import 'views/blue_square_rotate.dart';
import 'views/chained_animation.dart';
import 'views/three_dimensional_animation.dart';
import 'views/hero_animation.dart';
import 'views/implicit_animation.dart';
import 'views/tween_animation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: const HomePage(),
      routes: {
        blueSquareRotate: (context) => const BlueSquareRotateView(),
        chainedAnimation: (context) => const ChainedAnimationView(),
        threeDimensionalAnimation: (context) =>
            const ThreeDimensionalAnimationView(),
        heroAnimation: (context) => const HeroAnimationView(),
        implicitAnimation: (context) => const ImplicitAnimationView(),
        tweenAnimation: (context) => const TweenAnimationView(),
        customPainterPolygon: (context) => const CustomPainterPolygonView(),
        threeDimensionalDrawer: (context) => ThreeDimensionalDrawerView(
              drawer: const Center(child: Text('Drawer Content')),
              child: const Center(child: Text('Main Content')),
            ),
        animatedPrompt: (context) => const AnimatedPromptView(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> buttonConfigs = [
    {'text': 'Blue Square Rotate', 'route': blueSquareRotate},
    {'text': 'Chained Animation', 'route': chainedAnimation},
    {'text': '3D Animation', 'route': threeDimensionalAnimation},
    {'text': 'Hero Animation', 'route': heroAnimation},
    {'text': 'Implicit Animation', 'route': implicitAnimation},
    {'text': 'Tween Animation', 'route': tweenAnimation},
    {'text': 'Painter Polygon', 'route': customPainterPolygon},
    {'text': '3D Drawer', 'route': threeDimensionalDrawer},
    {'text': 'Animated Prompt', 'route': animatedPrompt},

    // Add more button configurations here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flutter Playground'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/menu');
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 3, // Number of columns
          mainAxisSpacing: 10, // Spacing between rows
          crossAxisSpacing: 10, // Spacing between columns
          children: List.generate(buttonConfigs.length, (index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, buttonConfigs[index]['route']!);
                  },
                  child: Text(buttonConfigs[index]['text']!),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
