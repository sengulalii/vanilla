import 'package:flutter/material.dart';
import 'package:vanilla/future/onboard/on_board_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData.light().copyWith(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromRGBO(11, 23, 84, 1),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const OnboardView(),
    );
  }
}
