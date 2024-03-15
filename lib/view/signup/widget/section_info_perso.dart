import 'package:auto_size_text/auto_size_text.dart';
import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../signup_controller.dart';

class SectionInfoPersonnel extends GetView<SignupController> {
  const SectionInfoPersonnel({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const AutoSizeText(
              "Renseigner vos informations personnels",
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
            ),
            const SizedBox(height: 20),
            ShadInput(
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black),
                controller: controller.nomprenom,
                padding: const EdgeInsets.all(12),
                placeholder: Text(
                  'Nom et prénom',
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.grey : Colors.black),
                )),
            Row(
              children: [
                ShadButton.outline(
                  padding: const EdgeInsets.all(12),
                  height: 45,
                  text: Text(
                    DateFormatter.formatStringDate(
                        date: controller.selectedDate.value,
                        inputFormat: 'yyyy-MM-dd HH:mm:ss',
                        outputFormat: 'dd-MM-yyyy'),
                    style: TextStyle(
                        color: controller.selectedDate.value ==
                                controller.initialSelectedDate
                            ? const Color.fromARGB(255, 46, 46, 46)
                            : Get.isDarkMode
                                ? Colors.white
                                : Colors.black),
                  ),
                  onPressed: () {
                    controller.selectDate(context);
                  },
                ),
                Expanded(
                    child: ShadInput(
                        style: TextStyle(
                            color:
                                Get.isDarkMode ? Colors.white : Colors.black),
                        controller: controller.lieunaiss,
                        padding: const EdgeInsets.all(12),
                        placeholder: Text(
                          'Lieu naissance',
                          style: TextStyle(
                              color:
                                  Get.isDarkMode ? Colors.grey : Colors.black),
                        ))),
              ],
            ),
            ShadInput(
              style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black),
              controller: controller.telephone,
              padding: const EdgeInsets.all(12),
              placeholder: Text(
                'Téléphone',
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.grey : Colors.black),
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ));
  }
}
