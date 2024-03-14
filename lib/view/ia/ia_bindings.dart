import 'package:get/get.dart';
import './ia_controller.dart';

class IaBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(IaController());
    }
}