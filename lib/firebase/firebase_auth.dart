// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uuid/uuid.dart';

import '../model/user.dart';
import '../routes/routes.dart';

class FirebasesAuth {
  final _firebaseAuth = FirebaseAuth.instance;
  User? get curentUser => _firebaseAuth.currentUser;
  var uuid = const Uuid();
  final box = GetStorage();

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  FirebaseAuth get firebaseAuthInstance => _firebaseAuth;

  sigInWithEmail({String? email, String? password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email!, password: password!);
  }

  Future<UserCredential> createUserWithEmail(
      {String? email, String? password}) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }

  restaurePasswordByEmail({String? email}) {
    try {
      return _firebaseAuth.sendPasswordResetEmail(email: email!.trim());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  signOut() async {
    Navigator.of(Get.context!).pop();
    await _firebaseAuth.signOut();
    box.erase();
    Get.offAllNamed(NamePageRoute.login);
  }

  sendPasswordResetEmail({String? email}) {
    return _firebaseAuth.sendPasswordResetEmail(email: email!.trim());
  }

  redirectionUtil({var data, BuildContext? context}) async {
    if (data != null) {
      var user = Users.fromMap(data);
      // je verifie si l'utilisateur à déjà un token pour les messages
      // Si c'est vide
      if (user.messagingToken == "vide") {
        // je lui créer un teken
        user.messagingsToken = box.read("messagingsToken");
        // Je modifie le token dans la bd
        // storage.updateMessagingToken(context: context, user: user, mes: "Vide");
      } else {
        // Si le token dans la bd n'est pas vide mais qu'il est different
        // en cas de changement de téléphone
        // if (user.messagingToken != box.read("messagingsToken")) {
        //   // je modifie avec le nouveau token
        //   user.messagingsToken = locator.get<HomeProvider>().messagingToken;
        //   locator.get<ServiceAuth>().updateMessagingToken(
        //       context: context, user: user, mes: "Changement de token");
        // }
        // Je charge le compte d'utilisateur dans la variable globale
      }
      box.write("user", jsonEncode(user.toMap()));
      // je fait les redirection
      if (data != null) {
        Get.offAllNamed(NamePageRoute.home);
      } else {
        Get.offAllNamed(NamePageRoute.login);
      }
    }
  }
}
