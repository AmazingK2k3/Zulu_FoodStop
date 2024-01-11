import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'OnboardingPage.dart';




void main() async {
   WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    runApp(const MyApp());
} 


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      routes: {
        '/onboardingPage': (context) => OnboardingPage(),
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the next page when the splash screen is clicked
        Navigator.of(context).pushNamed('/onboardingPage');
      },
      child: Scaffold( // Use Scaffold to allow the orange background to span across the screen
        backgroundColor: const Color(0xFFFF4B3A), // Set background color
        body: Center(
          child: Container(
            width: 500, // Adjust width as needed
            height: 500, // Adjust height as needed
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Zulu.png'), // Replace with your image file path
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}




