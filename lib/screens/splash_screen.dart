import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

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

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashScreenController = Get.put(SplashScreenController());

  ///
  @override
  Widget build(BuildContext context) {
    splashScreenController.startAnimation();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            ///
            Obx(
              () => AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                top: splashScreenController.animate.value ? 0 : -30,
                left: splashScreenController.animate.value ? 0 : -30,
                child: const SizedBox(
                  width: 200,
                  child: Image(image: AssetImage('assets/images/moneynote_title.png')),
                ),
              ),
            ),

            ///
            Obx(
              () => AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                top: 80,
                left: splashScreenController.animate.value ? tDefaultSize : -80,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1600),
                  opacity: splashScreenController.animate.value ? 1 : 0,
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
            ),

            ///
            Obx(
              () => AnimatedPositioned(
                duration: const Duration(milliseconds: 2400),
                bottom: splashScreenController.animate.value ? 60 : 0,
                child: const SizedBox(
                  width: 300,
                  child: Image(image: AssetImage('assets/images/coinpig.png')),
                ),
              ),
            ),

            ///
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
}
