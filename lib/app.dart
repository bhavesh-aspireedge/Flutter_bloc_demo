import 'package:bloc/home/ui/home_screen.dart';
import 'package:bloc/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        cardColor: AppColors.white,
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: AppColors.red
        )
      ),
      home: const HomeScreen(),
    );
  }
}