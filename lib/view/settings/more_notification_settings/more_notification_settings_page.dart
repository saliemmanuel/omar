import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:omar/config/palette.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import './more_notification_settings_controller.dart';

class MoreNotificationSettingsPage extends StatefulWidget {
  const MoreNotificationSettingsPage({Key? key}) : super(key: key);

  @override
  State<MoreNotificationSettingsPage> createState() =>
      _MoreNotificationSettingsPageState();
}

class _MoreNotificationSettingsPageState
    extends State<MoreNotificationSettingsPage> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(MoreNotificationSettingsController());

    return Scaffold(
        appBar: AppBar(
          title: const Text('Paramètre notification'),
        ),
        body: Obx(
          () => ListView(
            children: [
              const SizedBox(height: 10),
              
              Wrap(
                  alignment: WrapAlignment.center,
                  children: controller.joursSemaine
                      .map(
                          (e) => controller.selectedDay.contains(e)
                              ? ShadButton(
                                  text: Text(e),
                                  onPressed: () {
                                    controller.addDaysInSelecetedDay(e);
                                  setState(() {});
                                  },
                                )
                              : ShadButton.secondary(
                                  text: Text(e),
                                  onPressed: () {
                                    controller.addDaysInSelecetedDay(e);
                                  setState(() {});
                                  },
                                ),
                         )
                      .toList()),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(controller.selectedDateTime.value,
                      style: Get.textTheme.displayMedium),
                  IconButton(
                      onPressed: () {
                        controller.selectTime(context);
                      },
                      icon: const HeroIcon(HeroIcons.pencil))
                ],
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: Text(controller.info.value,
                    style: Get.textTheme.titleSmall),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ShadButton.destructive(
                      width: Get.width,
                      text: const Text('Annuler'),
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: ShadButton(
                      width: Get.width,
                      text: const Text('Sauvegarder'),
                      onPressed: () {
                        controller.saveNotificationSettings();
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
