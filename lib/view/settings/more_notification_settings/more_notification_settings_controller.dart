import 'dart:collection';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omar/firebase/firebase_storage.dart';
import 'package:omar/model/paremetre_notification.dart';
import 'package:omar/view/settings/settings_controller.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:uuid/uuid.dart';

import '../../../firebase/firebase_auth.dart';
import '../../global/dialogue.dart';

class MoreNotificationSettingsController extends GetxController {
  var storage = FirebaseStorage();
  var auth = FirebasesAuth();
  RxBool notificationSettingsAllReadyConfigured = false.obs;

  @override
  void onInit() {
    getNotificationData();
    super.onInit();
  }

  getNotificationData() async {
    dynamic notification = await storage.notificationSettingsData();
    if (notification != null) {
      notificationSettingsAllReadyConfigured.value = false;
      selectedDateTime.value = notification.heur;
      List listJour = jsonDecode(notification.selectedDaySemaine);
      for (var element in listJour) {
        selectedDay.add(element);
      }
    } else {
      notificationSettingsAllReadyConfigured.value = false;
    }
  }

  List<String> joursSemaine = ['L', 'Ma', 'Me', 'J', 'V', 'S', 'D'];
  RxString info =
      "Vous allez recevoir une notification tous les jours selectionner".obs;
  HashSet<String> selectedDay = HashSet();
  RxString selectedDateTime = "##:##".obs;
  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      final formattedHour =
          picked.hour < 10 ? '0${picked.hour}' : '${picked.hour}';
      final formattedMinute =
          picked.minute < 10 ? '0${picked.minute}' : '${picked.minute}';
      selectedDateTime.value = "$formattedHour:$formattedMinute";
    }
  }

  addDaysInSelecetedDay(String day) {
    if (selectedDay.contains(day)) {
      selectedDay.remove(day);
    } else {
      selectedDay.add(day);
    }
  }

  void saveNotificationSettings() async {
    var uuid = const Uuid();
    simpleDialogueCardSansTitle("Enregistrement...", Get.context!);
    var settingsController = Get.put(SettingsController());
    var notificationSettings = NotificationsSettingsModels(
        id: uuid.v8(),
        userId: auth.curentUser!.uid,
        activeSMSNotification: settingsController.activeSMSNotification.value,
        activeNotification: settingsController.activeNotification.value,
        selectedDaySemaine: jsonEncode(selectedDay.toList()),
        heur: selectedDateTime.value);

    try {
      await storage
          .saveNotificationSettings(
              notificationsSettingsModels: notificationSettings)
          .then((value) {
        Get.back();
        simpleDialog(
            context: Get.context!,
            title: "Paramètre notification",
            message: "Paramètre notification enregistrée avec succes.",
            cancelButton: Expanded(
              child: ShadButton(
                width: Get.width,
                text: const Text('Ok'),
                onPressed: () {
                  Navigator.of(Get.context!).pop(false);
                  // Get.offAndToNamed(NamePageRoute.login);
                },
              ),
            ),
            confirmButton: const SizedBox());
      });
    } on FirebaseAuthException catch (e) {
      Get.back();
      simpleDialog(
          context: Get.context!,
          title: "Erreur",
          message: e.message!,
          cancelButton: Expanded(
            child: ShadButton(
              width: Get.width,
              text: const Text('Ok'),
              onPressed: () {
                Navigator.of(Get.context!).pop(false);
                // Get.offAndToNamed(NamePageRoute.login);
              },
            ),
          ),
          confirmButton: const SizedBox());
    }
  }
}
