import 'package:flutter/material.dart';
import 'package:http_cat_flutter/features/random_cat/random_cat_page.dart';
import 'package:http_cat_flutter/shared/di.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RandomCatPage(),
    );
  }
}
