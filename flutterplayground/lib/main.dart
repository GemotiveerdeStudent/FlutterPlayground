import 'package:flutter/material.dart';
import 'views/blue_square_rotate.dart';
import 'views/chained_animation.dart';
import 'constants/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    theme: ThemeData(brightness: Brightness.dark),
    darkTheme: ThemeData(brightness: Brightness.dark),
    themeMode: ThemeMode.dark,
    debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    home: const HomePage(),
    routes: {
      blueSquareRotate: (context) => const BlueSquareRotateView(),
      chainedAnimation: (context) => const ChainedAnimationView(),
    },
  ));
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
    {'text': 'Green Square Rotate', 'route': '/greenSquareRotate'},
    {'text': 'Yellow Square Rotate', 'route': '/yellowSquareRotate'},
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
