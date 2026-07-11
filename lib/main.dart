import 'package:flutter/material.dart';

void main() {
  runApp(const SportPulseApp());
}

class SportPulseApp extends StatelessWidget {
  const SportPulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sport Pulse',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF0A192F),
        scaffoldBackgroundColor: const Color(0xFF020C1B),
        cardColor: const Color(0xFF112240),
        colorScheme: const ColorScheme.dark().copyWith(
          secondary: const Color(0xFF64FFDA), // Neon akcentusszín
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A192F),
          elevation: 0,
        ),
      ),
      home: const Scaffold(
        body: Center(
          child: Text('Üdv a Sport Pulse-ban!'),
        ),
      ),
    );
  }
}
