import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../signup_controller.dart';

class SectionInfoScolaire extends GetView<SignupController> {
  const SectionInfoScolaire({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const AutoSizeText(
          "Renseigner vos informations scolaires",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: ShadSelect<String>(
                  backgroundColor: Get.isDarkMode
                      ? Get.theme.scaffoldBackgroundColor
                      : Colors.white,
                  padding: const EdgeInsets.all(12),
                  placeholder: Text(controller.selectedDepartement.value),
                  options: [
                    ...controller.listDepartement.entries
                        .map((e) =>
                            ShadOption(value: e.key, child: Text(e.value)))
                        .toList(),
                  ],
                  selectedOptionBuilder: (context, value) {
                    controller.selectedDepartement.value =
                        controller.listDepartement[value]!;
                    return Text(controller.selectedDepartement.value);
                  }),
            ),
            Expanded(
              child: ShadSelect<String>(
                backgroundColor: Get.isDarkMode
                    ? Get.theme.scaffoldBackgroundColor
                    : Colors.white,
                padding: const EdgeInsets.all(12),
                placeholder: Text(controller.selectedParcours.value),
                options: [
                  ...controller.listParcours.entries
                      .map(
                          (e) => ShadOption(value: e.key, child: Text(e.value)))
                      .toList(),
                ],
                selectedOptionBuilder: (context, value) {
                  controller.selectedParcours.value =
                      controller.listParcours[value]!;
                  return Text(controller.selectedParcours.value);
                },
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ShadSelect<String>(
                backgroundColor: Get.isDarkMode
                    ? Get.theme.scaffoldBackgroundColor
                    : Colors.white,
                padding: const EdgeInsets.all(12),
                placeholder: Text(controller.selectedCycleNiveau.value),
                options: [
                  ...controller.listCycleNiveau.entries
                      .map(
                          (e) => ShadOption(value: e.key, child: Text(e.value)))
                      .toList(),
                ],
                selectedOptionBuilder: (context, value) {
                  controller.selectedCycleNiveau.value =
                      controller.listCycleNiveau[value]!;
                  return Text(controller.selectedCycleNiveau.value);
                },
              ),
            ),
          ],
        ),
        ShadInput(
          style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
          placeholder: Text(
            "Matricule",
            style:
                TextStyle(color: Get.isDarkMode ? Colors.grey : Colors.black),
          ),
          controller: controller.matricule,
          padding: const EdgeInsets.all(12),
        ),
      ],
    );
  }
}
