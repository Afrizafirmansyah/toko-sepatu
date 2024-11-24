import 'package:flutter/material.dart';
import 'home_page.dart'; // Import HomePage that will appear after SplashScreen

class SplashScreen extends StatefulWidget {
  static String tag = 'SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // Opacity animation
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    // Scale animation
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    // Start animation
    _controller.forward();

    // Navigate to HomePage after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logo = AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: CircleAvatar(
              radius: 72.0,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('images/logo1.jpg'),
            ),
          ),
        );
      },
    );

    final welcome = AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 50 * (1 - _opacityAnimation.value)),
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: Text(
              'Welcome!',
              style: TextStyle(fontSize: 40.0, color: Colors.black),
            ),
          ),
        );
      },
    );

    final tagline = AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 50 * (1 - _opacityAnimation.value)),
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: Text(
              'Store Sneakers',
              style: TextStyle(fontSize: 40.0, color: Colors.black),
            ),
          ),
        );
      },
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.white, Colors.white]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[logo, SizedBox(height: 16.0), welcome, tagline],
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}
