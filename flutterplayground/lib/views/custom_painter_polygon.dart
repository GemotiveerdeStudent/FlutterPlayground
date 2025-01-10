import 'package:flutter/material.dart';

class CustomPainterPolygonView extends StatefulWidget {
  const CustomPainterPolygonView({super.key});

  @override
  State<CustomPainterPolygonView> createState() =>
      _CustomPainterPolygonViewState();
}

class _CustomPainterPolygonViewState extends State<CustomPainterPolygonView> {
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
      ),
    );
  }
}
