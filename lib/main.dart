import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_selection/constants.dart';
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
        primary: AppConstant.primary,
        onPrimary: AppConstant.onPrimary,
        secondary: AppConstant.secondary,
        onSecondary: AppConstant.onSecondary,
        error: AppConstant.error,
        onError: AppConstant.onError,
        surface: AppConstant.surface,
        onSurface: AppConstant.onSurface,
        tertiary: AppConstant.tertiary,
        onTertiary: AppConstant.onTertiary,
      ),

      // For Text Style
      textTheme: const TextTheme(
        // It's Flutter default
        bodyMedium: TextStyle(
          fontSize: 18,
          fontFamily: AppConstant.kOrbitron,
        ),

        bodyLarge: TextStyle(
          fontSize: 24,
          fontFamily: AppConstant.kOrbitron,
        ),

        displaySmall: TextStyle(
          fontSize: 36,
          fontFamily: AppConstant.kOrbitron,
        ),

        headlineLarge: TextStyle(
          fontSize: 72,
          fontFamily: AppConstant.kOrbitron,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
            fontFamily: AppConstant.kOrbitron,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          backgroundColor: AppConstant.secondary,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
