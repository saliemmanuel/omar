import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omar/firebase/firebase_auth.dart';
import 'package:omar/firebase/firebase_storage.dart';
import 'package:omar/model/user.dart';
import 'package:omar/routes/routes.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../global/dialogue.dart';

class SignupController extends GetxController {
  var firebase = FirebasesAuth();
  var storage = FirebaseStorage();
  final pageController = PageController();
  RxBool onLastPage = false.obs;
  String initialSelectedDate = 'Date de naissance';
  RxString selectedDate = 'Date de naissance'.obs;
  RxBool acceptConditions = false.obs;
  DateTime selectedDateTime = DateTime.now();
  RxString selectedDepartement = "Département".obs;
  String initialSelectedDepartement = "Département";
  RxString selectedCycleNiveau = "Cycle et Niveau".obs;
  String initialSelectedCycleNiveau = "Cycle et Niveau";
  RxString selectedParcours = "Parcours".obs;
  String initialSelectedParcours = "Parcours";
  var matricule = TextEditingController();
  var nomprenom = TextEditingController();
  var lieunaiss = TextEditingController();
  var telephone = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var confirmpassword = TextEditingController();
  final listDepartement = {
    'infotel': 'INFOTEL',
  };

  final listParcours = {
    'datascience': 'DATA SCIENCE',
    'crypto': 'CRYPTOGRAFIE',
    'genielogiciel': 'GENIE LOGICIEL',
    'reseau': 'RESEAUX',
  };

  final listCycleNiveau = {
    'niv3': 'IC3',
    'niv4': 'IC4',
  };

  @override
  void onInit() {
    pageController.addListener(() {
      onLastPage.value = pageController.page!.round() >= 2.0;
    });
    super.onInit();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      selectedDate.value = picked.toString();
    }
  }

  void createUser() {
    firebase.createUserWithEmail(email: email.text, password: password.text);
  }

  inscription({BuildContext? context}) async {
    try {
      simpleDialogueCardSansTitle("Inscription...", context!);
      await firebase.createUserWithEmail(
          email: email.text, password: password.text);
      Stream<User?> response = firebase.authStateChanges;
      var isConnected = await response.any((element) => element!.email != null);
      if (isConnected) {
        var user = Users(
            id: firebase.curentUser!.uid,
            nomPrenom: nomprenom.text,
            email: email.text,
            telephone: telephone.text,
            departement: selectedDepartement.value,
            cycleNiveau: selectedCycleNiveau.value,
            parcours: selectedParcours.value,
            dateNaissance: selectedDate.value,
            matricule: matricule.text,
            lieuNaissance: lieunaiss.text,
            avatar: '',
            messagingToken: "vide");
        storage.saveUserDatas(user: user).then((value) => simpleDialog(
            context: context,
            title: "Inscription",
            message: "Compte cree avec succes, Omar vous souhaite la bienvenue",
            cancelButton: Expanded(
              child: ShadButton(
                width: Get.width,
                text: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                  Get.offAndToNamed(NamePageRoute.login);
                },
              ),
            ),
            confirmButton: const SizedBox()));
      }
    } on FirebaseAuthException catch (e) {
      Get.back();
      // ignore: use_build_context_synchronously
      simpleDialog(
          context: context!,
          message: e.message!,
          cancelButton: Expanded(
            child: ShadButton(
              width: Get.width,
              text: const Text('Ok'),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          ),
          confirmButton: const SizedBox());
    }
  }

  bool checkPhone(String chaine) {
    RegExp regex = RegExp(r'^2376[75982]|^6[75982]');
    if (regex.hasMatch(chaine) && (chaine.length == 12 || chaine.length == 9)) {
      return true;
    }
    return false;
  }

  bool isEmail(String email) {
    String p =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(email);
  }
}
