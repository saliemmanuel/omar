import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:omar/view/signup/widget/section_info_scolaire.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../global/dialogue.dart';
import './signup_controller.dart';
import 'widget/section_info_connexion.dart';
import 'widget/section_info_perso.dart';

class SignupPage extends GetView<SignupController> {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Omar'),
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: [
                const Text(
                  'Créer un compte',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 13),
                const Text.rich(
                  TextSpan(
                    text: 'Omar ',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: "vous invite créer votre compte. ",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Obx(
                      () => IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 230,
                              child: PageView(
                                  controller: controller.pageController,
                                  children: const [
                                    SectionInfoPersonnel(),
                                    SectionInfoScolaire(),
                                    SectionInfoConnexion(),
                                  ]),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: ShadButton(
                                    width: Get.width,
                                    text: const Text('Précedent'),
                                    onPressed: () {
                                      controller.pageController.previousPage(
                                          duration:
                                              const Duration(microseconds: 1),
                                          curve: Curves.linear);
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: ShadButton(
                                    width: Get.width,
                                    text: Text(controller.onLastPage.value
                                        ? "Créer un comte"
                                        : "Suivant"),
                                    onPressed: () {
                                      if (controller.onLastPage.value) {
                                        if (controller.nomprenom.text.isEmpty) {
                                          simpleDialog(
                                              message:
                                                  'Veuillez renseigner le nom et le prénom',
                                              context: context,
                                              cancelButton: const SizedBox(),
                                              confirmButton: Expanded(
                                                child: ShadButton(
                                                  width: Get.width,
                                                  text: const Text('Ok'),
                                                  onPressed: () {
                                                    Navigator.of(Get.context!)
                                                        .pop(false);
                                                    controller.pageController
                                                        .animateToPage(0,
                                                            duration:
                                                                const Duration(
                                                                    microseconds:
                                                                        1),
                                                            curve:
                                                                Curves.linear);
                                                  },
                                                ),
                                              ));
                                        } else if (controller
                                                .selectedDate.value ==
                                            controller.initialSelectedDate) {
                                          simpleDialog(
                                              message:
                                                  'Veuillez renseigner la date de naissance',
                                              context: context,
                                              cancelButton: const SizedBox(),
                                              confirmButton: Expanded(
                                                child: ShadButton(
                                                  width: Get.width,
                                                  text: const Text('Ok'),
                                                  onPressed: () {
                                                    Navigator.of(Get.context!)
                                                        .pop(false);
                                                    controller.pageController
                                                        .animateToPage(0,
                                                            duration:
                                                                const Duration(
                                                                    microseconds:
                                                                        1),
                                                            curve:
                                                                Curves.linear);
                                                  },
                                                ),
                                              ));
                                        } else if (controller
                                            .lieunaiss.text.isEmpty) {
                                          simpleDialog(
                                              message:
                                                  'Veuillez renseigner votre lieu de naissance',
                                              context: context,
                                              cancelButton: const SizedBox(),
                                              confirmButton: Expanded(
                                                child: ShadButton(
                                                  width: Get.width,
                                                  text: const Text('Ok'),
                                                  onPressed: () {
                                                    Navigator.of(Get.context!)
                                                        .pop(false);
                                                    controller.pageController
                                                        .animateToPage(0,
                                                            duration:
                                                                const Duration(
                                                                    microseconds:
                                                                        1),
                                                            curve:
                                                                Curves.linear);
                                                  },
                                                ),
                                              ));
                                        } else if (controller
                                            .telephone.text.isEmpty) {
                                          simpleDialog(
                                              message:
                                                  'Veuillez renseigner votre numéro de telephone',
                                              context: context,
                                              cancelButton: const SizedBox(),
                                              confirmButton: Expanded(
                                                child: ShadButton(
                                                  width: Get.width,
                                                  text: const Text('Ok'),
                                                  onPressed: () {
                                                    Navigator.of(Get.context!)
                                                        .pop(false);
                                                    controller.pageController
                                                        .animateToPage(0,
                                                            duration:
                                                                const Duration(
                                                                    microseconds:
                                                                        1),
                                                            curve:
                                                                Curves.linear);
                                                  },
                                                ),
                                              ));
                                        } else if (!controller.checkPhone(
                                            controller.telephone.text)) {
                                          simpleDialog(
                                              message:
                                                  'Veuillez renseigner un numéro de telephone valide',
                                              context: context,
                                              cancelButton: const SizedBox(),
                                              confirmButton: Expanded(
                                                child: ShadButton(
                                                  width: Get.width,
                                                  text: const Text('Ok'),
                                                  onPressed: () {
                                                    Navigator.of(Get.context!)
                                                        .pop(false);
                                                    controller.pageController
                                                        .animateToPage(0,
                                                            duration:
                                                                const Duration(
                                                                    microseconds:
                                                                        1),
                                                            curve:
                                                                Curves.linear);
                                                  },
                                                ),
                                              ));
                                        } else if (controller
                                                .selectedDepartement.value ==
                                            controller
                                                .initialSelectedDepartement) {
                                          simpleDialog(
                                              message:
                                                  'Veuillez renseigner votre departement',
                                              context: context,
                                              cancelButton: const SizedBox(),
                                              confirmButton: Expanded(
                                                child: ShadButton(
                                                  width: Get.width,
                                                  text: const Text('Ok'),
                                                  onPressed: () {
                                                    Navigator.of(Get.context!)
                                                        .pop(false);
                                                    controller.pageController
                                                        .animateToPage(1,
                                                            duration:
                                                                const Duration(
                                                                    microseconds:
                                                                        1),
                                                            curve:
                                                                Curves.linear);
                                                  },
                                                ),
                                              ));
                                        } else if (controller
                                                .selectedParcours.value ==
                                            controller
                                                .initialSelectedParcours) {
                                          simpleDialog(
                                              message:
                                                  'Veuillez renseigner votre parcours',
                                              context: context,
                                              cancelButton: const SizedBox(),
                                              confirmButton: Expanded(
                                                child: ShadButton(
                                                  width: Get.width,
                                                  text: const Text('Ok'),
                                                  onPressed: () {
                                                    Navigator.of(Get.context!)
                                                        .pop(false);
                                                    controller.pageController
                                                        .animateToPage(1,
                                                            duration:
                                                                const Duration(
                                                                    microseconds:
                                                                        1),
                                                            curve:
                                                                Curves.linear);
                                                  },
                                                ),
                                              ));
                                        } else if (controller
                                                .selectedCycleNiveau.value ==
                                            controller
                                                .initialSelectedCycleNiveau) {
                                          simpleDialog(
                                              message:
                                                  'Veuillez renseigner votre cycle et niveau',
                                              context: context,
                                              cancelButton: const SizedBox(),
                                              confirmButton: Expanded(
                                                child: ShadButton(
                                                  width: Get.width,
                                                  text: const Text('Ok'),
                                                  onPressed: () {
                                                    Navigator.of(Get.context!)
                                                        .pop(false);
                                                    controller.pageController
                                                        .animateToPage(1,
                                                            duration:
                                                                const Duration(
                                                                    microseconds:
                                                                        1),
                                                            curve:
                                                                Curves.linear);
                                                  },
                                                ),
                                              ));
                                        } else if (controller
                                            .matricule.text.isEmpty) {
                                          simpleDialog(
                                              message:
                                                  'Veuillez renseigner votre matricule',
                                              context: context,
                                              cancelButton: const SizedBox(),
                                              confirmButton: Expanded(
                                                child: ShadButton(
                                                  width: Get.width,
                                                  text: const Text('Ok'),
                                                  onPressed: () {
                                                    Navigator.of(Get.context!)
                                                        .pop(false);
                                                    controller.pageController
                                                        .animateToPage(1,
                                                            duration:
                                                                const Duration(
                                                                    microseconds:
                                                                        1),
                                                            curve:
                                                                Curves.linear);
                                                  },
                                                ),
                                              ));
                                        } else if (controller
                                                .matricule.text.length <
                                            6) {
                                          simpleDialog(
                                              message:
                                                  'Veuillez renseigner un matricule valide',
                                              context: context,
                                              cancelButton: const SizedBox(),
                                              confirmButton: Expanded(
                                                child: ShadButton(
                                                  width: Get.width,
                                                  text: const Text('Ok'),
                                                  onPressed: () {
                                                    Navigator.of(Get.context!)
                                                        .pop(false);
                                                    controller.pageController
                                                        .animateToPage(1,
                                                            duration:
                                                                const Duration(
                                                                    microseconds:
                                                                        1),
                                                            curve:
                                                                Curves.linear);
                                                  },
                                                ),
                                              ));
                                        } else if (controller
                                            .email.text.isEmpty) {
                                          simpleDialog(
                                              message:
                                                  'Veuillez renseigner votre email',
                                              context: context,
                                              cancelButton: const SizedBox(),
                                              confirmButton: Expanded(
                                                child: ShadButton(
                                                  width: Get.width,
                                                  text: const Text('Ok'),
                                                  onPressed: () {
                                                    Navigator.of(Get.context!)
                                                        .pop(false);
                                                    controller.pageController
                                                        .animateToPage(2,
                                                            duration:
                                                                const Duration(
                                                                    microseconds:
                                                                        1),
                                                            curve:
                                                                Curves.linear);
                                                  },
                                                ),
                                              ));
                                        } else if (!controller
                                            .isEmail(controller.email.text)) {
                                          simpleDialog(
                                              message:
                                                  'Veuillez renseigner un email valide',
                                              context: context,
                                              cancelButton: const SizedBox(),
                                              confirmButton: Expanded(
                                                child: ShadButton(
                                                  width: Get.width,
                                                  text: const Text('Ok'),
                                                  onPressed: () {
                                                    Navigator.of(Get.context!)
                                                        .pop(false);
                                                    controller.pageController
                                                        .animateToPage(2,
                                                            duration:
                                                                const Duration(
                                                                    microseconds:
                                                                        1),
                                                            curve:
                                                                Curves.linear);
                                                  },
                                                ),
                                              ));
                                        } else if (controller
                                            .password.text.isEmpty) {
                                          simpleDialog(
                                              message:
                                                  'Veuillez renseigner votre mot de passe',
                                              context: context,
                                              cancelButton: const SizedBox(),
                                              confirmButton: Expanded(
                                                child: ShadButton(
                                                  width: Get.width,
                                                  text: const Text('Ok'),
                                                  onPressed: () {
                                                    Navigator.of(Get.context!)
                                                        .pop(false);
                                                    controller.pageController
                                                        .animateToPage(2,
                                                            duration:
                                                                const Duration(
                                                                    microseconds:
                                                                        1),
                                                            curve:
                                                                Curves.linear);
                                                  },
                                                ),
                                              ));
                                        } else if (controller
                                            .confirmpassword.text.isEmpty) {
                                          simpleDialog(
                                              message:
                                                  'Veuillez confirmer votre mot de passe',
                                              context: context,
                                              cancelButton: const SizedBox(),
                                              confirmButton: Expanded(
                                                child: ShadButton(
                                                  width: Get.width,
                                                  text: const Text('Ok'),
                                                  onPressed: () {
                                                    Navigator.of(Get.context!)
                                                        .pop(false);
                                                    controller.pageController
                                                        .animateToPage(2,
                                                            duration:
                                                                const Duration(
                                                                    microseconds:
                                                                        1),
                                                            curve:
                                                                Curves.linear);
                                                  },
                                                ),
                                              ));
                                        } else if (controller.password.text !=
                                            controller.confirmpassword.text) {
                                          simpleDialog(
                                              message:
                                                  'Les mot de passe ne sont pas identiques',
                                              context: context,
                                              cancelButton: const SizedBox(),
                                              confirmButton: Expanded(
                                                child: ShadButton(
                                                  width: Get.width,
                                                  text: const Text('Ok'),
                                                  onPressed: () {
                                                    Navigator.of(Get.context!)
                                                        .pop(false);
                                                    controller.pageController
                                                        .animateToPage(2,
                                                            duration:
                                                                const Duration(
                                                                    microseconds:
                                                                        1),
                                                            curve:
                                                                Curves.linear);
                                                  },
                                                ),
                                              ));
                                        } else if (controller
                                                .confirmpassword.text.length <
                                            8) {
                                          simpleDialog(
                                              message:
                                                  'Le mot de passe doit contenir au moins 8 caractères',
                                              context: context,
                                              cancelButton: const SizedBox(),
                                              confirmButton: Expanded(
                                                child: ShadButton(
                                                  width: Get.width,
                                                  text: const Text('Ok'),
                                                  onPressed: () {
                                                    Navigator.of(Get.context!)
                                                        .pop(false);
                                                    controller.pageController
                                                        .animateToPage(2,
                                                            duration:
                                                                const Duration(
                                                                    microseconds:
                                                                        1),
                                                            curve:
                                                                Curves.linear);
                                                  },
                                                ),
                                              ));
                                        } else {
                                          controller.inscription(
                                              context: context);
                                        }
                                      } else {
                                        controller.pageController.nextPage(
                                            duration:
                                                const Duration(microseconds: 1),
                                            curve: Curves.linear);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            InkWell(
                              onTap: () => Get.back(),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Vous avez deja un compte?",
                                      style: TextStyle(fontSize: 12)),
                                  TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text('Se connecter',
                                          style: TextStyle(fontSize: 12)))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
