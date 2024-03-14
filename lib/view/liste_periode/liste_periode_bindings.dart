import 'package:get/get.dart';
import './liste_periode_controller.dart';

class ListePeriodeBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(ListePeriodeController());
    }
}