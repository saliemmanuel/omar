import 'package:get/get.dart';
import './signup_controller.dart';

class SignupBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(SignupController());
    }
}