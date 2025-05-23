import 'package:ask_now_bot/pages/home_page.dart';
import 'package:ask_now_bot/theme/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        scaffoldBackgroundColor:AppColors.background,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.submitButton)
      ),
      home: HomePage()
    );
  }
}

