import 'dart:math';

import 'package:flutter/material.dart';

class ThreeDimensionalDrawerView extends StatefulWidget {
  final Widget child;
  final Widget drawer;
  const ThreeDimensionalDrawerView({
    super.key,
    required this.child,
    required this.drawer,
  });

  @override
  State<ThreeDimensionalDrawerView> createState() =>
      _ThreeDimensionalDrawerViewState();
}

class _ThreeDimensionalDrawerViewState extends State<ThreeDimensionalDrawerView>
    with TickerProviderStateMixin {
  late AnimationController _xControllerForChild;
  late Animation<double> _yRotationAnimationForChild;

  late AnimationController _xControllerForDrawer;
  late Animation<double> _yRotationAnimationForDrawer;

  @override
  void initState() {
    super.initState();
    _xControllerForChild = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 500),
    );
    _yRotationAnimationForChild = Tween<double>(
      begin: 0,
      end: -pi / 2,
    ).animate(_xControllerForChild);

    _xControllerForDrawer = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 500),
    );
    _yRotationAnimationForDrawer = Tween<double>(
      begin: 0,
      end: -pi / 2,
    ).animate(_xControllerForDrawer);
  }

  @override
  void dispose() {
    _xControllerForChild.dispose();
    _xControllerForDrawer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThreeDimensionalDrawerView(
      drawer: Material(
        child: Container(
          color: const Color(0xFF24283b),
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 0, top: 100),
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Item $index'),
              );
            },
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Drawer'),
        ),
        body: Container(color: const Color(0xff414868)),
      ),
    );
  }
}
