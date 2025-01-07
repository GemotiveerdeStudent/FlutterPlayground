import 'package:flutter/material.dart';
import 'views/blue_square_rotate.dart';
import 'constants/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    title: 'Flutter Playground',
    theme: ThemeData(brightness: Brightness.dark),
    darkTheme: ThemeData(brightness: Brightness.dark),
    themeMode: ThemeMode.dark,
    debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    home: const HomePage(),
    routes: {
      blueSquareRotate: (context) => const BlueSquareRotateView(),
    },
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Playground'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, blueSquareRotate);
              },
              child: const Text('Blue Square Rotate'),
            ),
          ],
        ),
      ),
    );
  }
}
