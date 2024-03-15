import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../firebase/firebase_auth.dart';
import '../../firebase/firebase_storage.dart';
import '../../routes/routes.dart';
import '../global/dialogue.dart';

class SplashController extends GetxController {
  final name = "Omar";
  final firebase = FirebasesAuth();
  final storage = FirebaseStorage();
  final box = GetStorage();
  @override
  void onInit() async {
    super.onInit();
    // Future.delayed(
    //   const Duration(seconds: 3),
    //   () => Get.offAndToNamed(NamePageRoute.login),
    // );
    initNextPage();
  }

  // initialiation de la page suivante
  initNextPage() async {
    // Initialisation le temps d'attente à 2s
    Timer(
      const Duration(seconds: 1),
      () async {
        try {
          // je verifie si l'user est authentifier
          if (firebase.curentUser != null) {
            if (box.read("isConnected") != null) {
              // je recupère ses informations de la bd a partir de son uid
              dynamic docs =
                  await storage.getUserData(id: firebase.curentUser!.uid);
              Map<String, dynamic>? data = docs?.data();
              // je verifie si l'utilisateur est déjà enregistré dans la
              firebase.redirectionUtil(context: Get.context, data: data);
            } else {
              Get.offAllNamed(NamePageRoute.login);
            }
          } else {
            Get.offAllNamed(NamePageRoute.login);
          }
        } on FirebaseAuthException catch (e) {
          // errorDialogueCard("Erreur", e.message!, context);
          simpleDialog(
              context: Get.context!,
              message: e.message!,
              cancelButton: ShadButton.outline(
                text: const Text('Cancel'),
                onPressed: () => Navigator.of(Get.context!).pop(false),
              ),
              confirmButton: const SizedBox());
        }
      },
    );
  }
}
