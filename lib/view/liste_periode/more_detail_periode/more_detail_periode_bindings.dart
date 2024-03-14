import 'package:get/get.dart';
import './more_detail_periode_controller.dart';

class MoreDetailPeriodeBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(MoreDetailPeriodeController());
    }
}