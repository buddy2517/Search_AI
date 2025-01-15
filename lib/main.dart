import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:search_ai/pages/home_page.dart';
import 'package:search_ai/theme/colors.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async{
  await dotenv.load(fileName: "server/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Search AI',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.submitButton),
        textTheme: GoogleFonts.interTextTheme(
          ThemeData.dark().textTheme.copyWith(
            bodyMedium: const TextStyle(
              fontSize: 15,color: AppColors.whiteColor
            )
          )
        ),
      ),
      home: const HomePage(),
    );
  }
}
