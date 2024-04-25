import 'package:get/get.dart';

import '../screens/welcome_screen.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();

  RxBool animate = false.obs;

  ///
  Future<void> startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));

    animate.value = true;

    await Future.delayed(const Duration(milliseconds: 5000));

//    await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));

    await Get.to(const WelcomeScreen());
  }
}
