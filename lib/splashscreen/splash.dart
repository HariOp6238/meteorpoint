import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meteorpoint/view/homepage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Homepage())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Stack(
          children: [
            SizedBox(
                child: Lottie.asset('assets/Animation - 1701448195937.json',
                    fit: BoxFit.fill)),
          ],
        ),
      ),
    );
  }
}
