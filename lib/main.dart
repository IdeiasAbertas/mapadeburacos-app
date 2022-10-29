import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapa_de_buracos_app_flutter/features/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Krukuteca',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        textTheme: TextTheme(
          headline1: GoogleFonts.poppins(),
          headline6: GoogleFonts.poppins(),
          bodyText2: GoogleFonts.poppins(),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: GoogleFonts.poppins(),
        ),
      ),
      home: const HomePage(),
    );
  }
}
