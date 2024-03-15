import 'package:get/get.dart';
import './more_notification_settings_controller.dart';

class MoreNotificationSettingsBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(MoreNotificationSettingsController());
    }
}