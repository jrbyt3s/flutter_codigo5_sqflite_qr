import 'package:flutter/material.dart';
import 'package:flutter_codigo5_sqflite_qr/pages/intro_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Vaccine Storage App",
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme(),
        //useMaterial3: true,
        //colorScheme: ColorScheme.dark(),
      ),
      home: IntroPage(),
    );
  }
}
