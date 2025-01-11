import 'package:flutter/material.dart';
import 'package:movie_app_task/screens/home/home_screen.dart';
import 'package:movie_app_task/screens/search_screen.dart';
import 'package:movie_app_task/screens/slpash_screen.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
