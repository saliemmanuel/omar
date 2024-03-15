// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:omar/firebase/firebase_storage.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../firebase/firebase_auth.dart';
import '../global/dialogue.dart';

class LoginController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  var firebase = FirebasesAuth();
  var storage = FirebaseStorage();
  final box = GetStorage();

  void connexion({BuildContext? context}) async {
    try {
      simpleDialogueCardSansTitle("Connexion...", context!);
      await firebase.sigInWithEmail(email: email.text, password: password.text);
      Stream<User?> response = firebase.authStateChanges;
      var isConnected = await response.any((element) => element!.email != null);
      if (isConnected) {
        dynamic docs = await storage.getUserData(id: firebase.curentUser!.uid);
        Map<String, dynamic>? data = docs?.data();
        // je verifie si l'utilisateur est déjà enregistré dans la bd
        if (data == null) {
          // je l'enregistre dans la bd;
          if (Get.isDialogOpen!) {
            Get.back();
            simpleDialog(
                context: context,
                message: "Une erreur est survenue. Veuillez reessayer",
                cancelButton: ShadButton.outline(
                  text: const Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                confirmButton: const SizedBox());
          }
        } else {
          Navigator.of(context).pop();
          box.write("isConnected", "true");
          firebase.redirectionUtil(context: context, data: data);
        }
      }
    } on FirebaseAuthException catch (e) {
      Get.back();
      simpleDialog(
          context: Get.context!,
          message: e.message!,
          cancelButton: Expanded(
            child: ShadButton(
              width: Get.width,
              text: const Text('Ok'),
              onPressed: () => Navigator.of(Get.context!).pop(false),
            ),
          ),
          confirmButton: const SizedBox());
    }
  }
}
