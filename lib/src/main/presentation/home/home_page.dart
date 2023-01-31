import 'package:bloc_skeleton/src/example/presentation/example/example_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, ExamplePage.route);
          },
          child: const Text('Open Example'),
        ),
      ),
    );
  }
}
