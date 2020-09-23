import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tribus/Desktop/desktop.dart';
import 'package:tribus/Mobile/mobile.dart';
import 'package:tribus/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tribus',
        theme: ThemeData(
          primaryColor: kBlueColor,
            textTheme: GoogleFonts.playfairDisplayTextTheme(
                Theme.of(context).textTheme)),
        home: LayoutBuilder(builder: (context, contraints) {
          if (contraints.minWidth >= 720)
            return DesktopHome();
          else
            return MobileHome();
        }));
  }
}
