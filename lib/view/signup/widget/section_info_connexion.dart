import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../signup_controller.dart';

class SectionInfoConnexion extends GetView<SignupController> {
  const SectionInfoConnexion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const AutoSizeText(
          "Renseigner vos informations connexions",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
        ),
        const SizedBox(height: 20),
        ShadInput(
            style:
                TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
            controller: controller.email,
            padding: const EdgeInsets.all(12),
            keyboardType: TextInputType.emailAddress,
            placeholder: Text(
              'E-mail',
              style:
                  TextStyle(color: Get.isDarkMode ? Colors.grey : Colors.black),
            )),
        ShadInput(
            style:
                TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
            controller: controller.password,
            obscureText: true,
            padding: const EdgeInsets.all(12),
            placeholder: Text(
              'Mot de passe',
              style:
                  TextStyle(color: Get.isDarkMode ? Colors.grey : Colors.black),
            )),
        ShadInput( 
            style:
                TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
            controller: controller.confirmpassword,
            obscureText: true,
            padding: const EdgeInsets.all(12),
            placeholder: Text(
              'Confirmer mot de passe',
              style:
                  TextStyle(color: Get.isDarkMode ? Colors.grey : Colors.black),
            )),
      ],
    );
  }
}
