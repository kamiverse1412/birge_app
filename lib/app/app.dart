import 'package:birge_app/features/auth/pages/home_page.dart';
import 'package:flutter/material.dart'; // Your home page
// import '../features/auth/pages/login_page.dart';  // REMOVE OR IGNORE

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Birge AI',
      home: const AIHomePage(), // THIS MUST BE THE FIRST SCREEN
    );
  }
}
