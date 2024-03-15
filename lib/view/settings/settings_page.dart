import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:omar/view/global/avatar_widget.dart';
import 'package:omar/view/settings/more_notification_settings/more_notification_settings_controller.dart';
import '../../config/palette.dart';
import '../../routes/routes.dart';
import '../global/dialogue.dart';
import './settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SettingsController());
    final moreNotifSetting = Get.put(MoreNotificationSettingsController());
    final scaffoldStateKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: scaffoldStateKey,
        body: Obx(() => CupertinoScrollbar(
              child: Container(
                  margin: const EdgeInsets.all(5),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AvatarWidget(),
                          const SizedBox(height: 12),
                          const Center(child: Text("SALI EMMANUEL")),
                          const SizedBox(height: 12),
                          const Text("App"),
                          const SizedBox(height: 12),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(.2)),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(.2)),
                                  ),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        leading: const HeroIcon(
                                            HeroIcons.informationCircle),
                                        title: Text('A-propos'.tr),
                                        onTap: () {
                                          Get.toNamed(NamePageRoute.about);
                                        },
                                      ),
                                      const Divider(),
                                      ListTile(
                                        leading: const HeroIcon(HeroIcons.moon),
                                        title: Text('Dark mode'.tr),
                                        trailing: CupertinoSwitch(
                                          activeColor: Palette.primaryColor,
                                          value: controller.changeTheme.value,
                                          onChanged: (val) {
                                            controller.changeThemeValue(
                                                controller.changeTheme.value);
                                          },
                                        ),
                                        onTap: () {
                                          controller.changeThemeValue(
                                              controller.changeTheme.value);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),
                          const Text("Notifications"),
                          const SizedBox(height: 12),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(.2)),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(.2)),
                                  ),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        leading:
                                            const HeroIcon(HeroIcons.bellAlert),
                                        title: const Text("Notifications"),
                                        trailing: CupertinoSwitch(
                                          activeColor: Palette.primaryColor,
                                          value: controller
                                              .activeNotification.value,
                                          onChanged: (val) {
                                            controller.changeValueNotification(
                                                controller
                                                    .activeNotification.value);
                                            moreNotifSetting
                                                .saveNotificationSettings();
                                          },
                                        ),
                                        onTap: () {
                                          controller.changeValueNotification(
                                              controller
                                                  .activeNotification.value);
                                          moreNotifSetting
                                              .saveNotificationSettings();
                                        },
                                      ),
                                      const Divider(),
                                      ListTile(
                                        leading: const HeroIcon(HeroIcons
                                            .chatBubbleOvalLeftEllipsis),
                                        title: const Text("Notifications SMS"),
                                        trailing: CupertinoSwitch(
                                          activeColor: Palette.primaryColor,
                                          value: controller
                                              .activeSMSNotification.value,
                                          onChanged: (val) {
                                            controller
                                                .changeValueNotificationSMS(
                                                    controller
                                                        .activeSMSNotification
                                                        .value);
                                            moreNotifSetting
                                                .saveNotificationSettings();
                                          },
                                        ),
                                        onTap: () {
                                          controller.changeValueNotificationSMS(
                                              controller
                                                  .activeSMSNotification.value);
                                          moreNotifSetting
                                              .saveNotificationSettings();
                                        },
                                      ),
                                      const Divider(),
                                      ListTile(
                                        leading: const HeroIcon(HeroIcons.cog),
                                        title: const Text("Plus de paramètres"),
                                        onTap: () {
                                          Get.toNamed(NamePageRoute
                                              .moreNotificationSettings);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),
                          const Text("Compte"),
                          const SizedBox(height: 12),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(.2)),
                            ),
                            child: ListTile(
                              leading: const HeroIcon(
                                  HeroIcons.arrowRightOnRectangle),
                              title: Text('Déconnexion'.tr),
                              onTap: () {
                                scaffoldStateKey.currentState?.showBottomSheet(
                                  (context) {
                                    return bottomSheetExit(
                                      Get.context!,
                                      title:
                                          'Êtes-vous sûr de vouloir vous déconnecter ?',
                                      onConfirm: () async {
                                        simpleDialogueCardSansTitle(
                                            "Déconnexion...", Get.context!);
                                        await Future.delayed(
                                          const Duration(seconds: 2),
                                          () {
                                            controller.firebase.signOut();
                                          },
                                        );
                                      },
                                      onCancel: () {
                                        Navigator.of(Get.context!).pop();
                                      },
                                    );
                                  },
                                  backgroundColor: Colors.transparent,
                                  elevation: 2,
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 50),
                        ]),
                  )),
            )));
  }
}
