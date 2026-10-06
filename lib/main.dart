import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/car_provider.dart';
import 'pages/garege_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => CarProvider(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Garagem Virtual',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.dark,
        ),

        scaffoldBackgroundColor: const Color(0xFF0D0D0D),

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),

        cardTheme: const CardThemeData(color: Color.fromARGB(255, 36, 36, 36)),

        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),

        dialogTheme: const DialogThemeData(
          backgroundColor: Color(0xFF1A1A1A),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),

        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.white70),
          hintStyle: TextStyle(color: Colors.white54),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white54),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
        ),

        useMaterial3: true,
      ),
      home: const GaragePage(),
    );
  }
}
