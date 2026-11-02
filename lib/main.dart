import 'package:flutter/material.dart';
import 'package:missing_hours_again/view/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:missing_hours_again/theme/app_theme.dart';
import 'package:missing_hours_again/view/settings.dart';
import 'package:missing_hours_again/widgtes/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Missing Hours Again?',
      theme: AppTheme.capybara,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Missing Hours Again?",
              style: GoogleFonts.inknutAntiqua(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            toolbarHeight: 75,
          ),
          body: TabBarView(
            children: [
              Home(context: context),
              Settings(),
            ],
          ),
          bottomNavigationBar: BottomNavBar(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
