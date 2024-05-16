import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_selection/cubit/home_cubit.dart';
import 'package:number_selection/home_screen.dart';
import 'package:number_selection/number_sequence_helper.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.standardTheme,
      home: BlocProvider(
        create: (context) => HomeCubit(
          NumberSequenceHelper(
            random: Random(),
          ),
        ),
        child: const HomeScreen(),
      ),
    );
  }
}

class AppTheme {
  static ThemeData get standardTheme {
    return ThemeData(
      // Color Scheme
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF2196F3),
        onPrimary: Color(0xFFFFFFFF),
        secondary: Color(0xFFFF9800),
        onSecondary: Color(0xFF000000),
        error: Color(0xFFF44336),
        onError: Color(0xFFFFFFFF),
        surface: Color(0xFFFFFFFF),
        onSurface: Color(0xFF000000),
        tertiary: Color(0xFF4CAF50),
        onTertiary: Color(0xFFFFFFFF),
      ),

      // For Text Style
      textTheme: const TextTheme(
        // It's Flutter default
        bodyMedium: TextStyle(
          fontSize: 18,
        ),

        displaySmall: TextStyle(
          fontSize: 36,
        ),

        headlineLarge: TextStyle(
          fontSize: 72,
        ),
      ),
    );
  }
}
