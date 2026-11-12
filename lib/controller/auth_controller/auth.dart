import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AuthController extends GetxController {
  RxBool isTab = false.obs;

  void tooggleTab() {
    isTab.value = !isTab.value;
  }
}
