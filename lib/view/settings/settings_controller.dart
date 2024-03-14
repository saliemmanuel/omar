import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../firebase/firebase_auth.dart';

class SettingsController extends GetxController {
  final RxBool changeTheme = false.obs;
  final RxBool activeNotification = false.obs;
  final RxBool activeSMSNotification = false.obs;
  var firebase = FirebasesAuth();

  var box = GetStorage();
  @override
  void onInit() {
    changeTheme.value = box.read('theme') == 'dark';
    super.onInit();
  }

  changeThemeValue(var value) {
    changeTheme.value = !value;
    if (changeTheme.value) {
      Get.changeTheme(ThemeData.dark());
      box.write('theme', 'dark');
    } else {
      Get.changeTheme(ThemeData.light());
      box.write('theme', 'light');
    }
  }

  changeValueNotification(var value) {
    activeNotification.value = !value;
    if (activeNotification.value) {
      box.write('activeNotification', 'active');
    } else {
      box.write('activeNotification', 'inactive');
    }
  }

  changeValueNotificationSMS(var value) {
    activeSMSNotification.value = !value;
    if (activeSMSNotification.value) {
      box.write('activeSMSNotification', 'active');
    } else {
      box.write('activeSMSNotification', 'inactive');
    }
  }
}
