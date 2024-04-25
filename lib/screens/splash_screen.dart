import 'package:flutter/material.dart';

import 'welcome_screen.dart';

const tPrimaryColor = Color(0xffffe400);
const tSecondaryColor = Color(0xff272727);
const tAccentColor = Color(0xff001bff);

const tCardBgColor = Color(0xfff7f6f1);
const tWhiteColor = Color(0xffffffff);
const tDarkColor = Color(0xff000000);

const tDefaultSize = 30.0;
const tSplashContainerSize = 30.0;

const tFirstLine = 'aaaaaaaaaa';
const tSecondLine = 'bbbbbbbbbb';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;

  ///
  @override
  void initState() {
    super.initState();

    startAnimation();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: animate ? 0 : -30,
              left: animate ? 0 : -30,
              child: const SizedBox(
                width: 200,
                child: Image(image: AssetImage('assets/images/moneynote_title.png')),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: 80,
              left: animate ? tDefaultSize : -80,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1600),
                opacity: animate ? 1 : 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tFirstLine,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.white),
                    ),
                    Text(
                      tSecondLine,
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              bottom: animate ? 60 : 0,
              child: const SizedBox(
                width: 300,
                child: Image(image: AssetImage('assets/images/coinpig.png')),
              ),
            ),
            Positioned(
              bottom: 40,
              right: tDefaultSize,
              child: Container(
                width: tSplashContainerSize,
                height: tSplashContainerSize,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: tPrimaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  Future<void> startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));

    setState(() => animate = true);

    await Future.delayed(const Duration(milliseconds: 5000));

    await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
  }
}
