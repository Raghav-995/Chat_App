import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: 5.0,
      color: Theme.of(context).colorScheme.inversePrimary,
    );
  }
}
