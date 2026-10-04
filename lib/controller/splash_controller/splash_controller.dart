import 'package:get/get.dart';

import '../../view/pages/homepage/homepage.dart';


class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    Get.off(
          () => const HomeScreen(),
    );
  }
}