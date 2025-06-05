import 'package:fitnessapp/pages/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  double _opacity = 0.0;
  double _scale = 0.8;

  // Define a color scheme
  final Color primaryColor = const Color(0xff92A3FD);
  final Color secondaryColor = const Color(0xff9DCEFF);
  final Color backgroundColor = const Color(0xffF7F8F8);
  final Color accentColor = const Color(0xffC58BF2);

  @override
  void initState() {
    super.initState();

    // Start the animation
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1.0;
        _scale = 1.0;
      });
    });

    // Navigate after delay
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 1000),
          opacity: _opacity,
          child: AnimatedScale(
            duration: Duration(milliseconds: 1000),
            scale: _scale,
            curve: Curves.easeOutBack,
            child: Container(
              padding: EdgeInsets.all(32),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [primaryColor, secondaryColor, accentColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.2),
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.fastfood, size: 100, color: Colors.white),
                  SizedBox(height: 20),
                  Text(
                    "Fitness App",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                      shadows: [
                        Shadow(
                          color: accentColor.withOpacity(0.3),
                          blurRadius: 8,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
