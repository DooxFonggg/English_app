import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test app bar'),
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
            Expanded(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
            ),
            Expanded(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
