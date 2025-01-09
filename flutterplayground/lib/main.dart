import 'constants/routes.dart';
import 'package:flutter/material.dart';
import 'views/blue_square_rotate.dart';
import 'views/chained_animation.dart';
import 'views/three_dimensional_animation.dart';
import 'views/hero_animation.dart';

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
    {'text': 'Implicit animation', 'route': implicitAnimation},
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
          crossAxisCount: 2, // Number of columns
          mainAxisSpacing: 20, // Spacing between rows
          crossAxisSpacing: 20, // Spacing between columns
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
