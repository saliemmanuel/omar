import 'dart:convert';
import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:omar/config/palette.dart';

import '../model/user.dart';

/// J'ecoute les notifications entrant dans l'application
/// même quand l'application est en arrêt
/// avec cette méthode
Future<void> backgroundMessagingHandler(RemoteMessage message) async {
  print("message.data");
  print(message.data);
  AwesomeNotifications().createNotificationFromJsonData(message.data);
}

/// Classe qui va nous permettre la gestion des
/// - Notifications de l'applicaiton
///

class FireMessageging {
  /// Instance de FirebaseMessaging
  var messaging = FirebaseMessaging.instance;
  var box = GetStorage();

  /// Pour envoyer une notification à un utilisateur
  /// il faut le token de Firebase Messaging unique à chaque utilisateur
  /// cette méthode permet de generer ce token
  getTokenDeviceToken() async {
    await messaging.requestPermission();
    await messaging.getToken().then((token) async {
      if (token != null) {
        // ici uplader le Token de l'utilisateur pour un éventuelle utilisation
        debugPrint('Push Token: $token');
        box.write('token_messaging', token);
      }
    });
    FirebaseMessaging.onBackgroundMessage(backgroundMessagingHandler);
  }

  /// Initialisation du plugin AwesomeNotifications
  /// Pour l'affichage des notifications
  static Future<void> initializeLocalNotifications() async {
    await AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
            channelKey: 'YelloKiosk',
            channelName: 'YelloKiosk',
            channelDescription: 'Notification YelloKiosk',
            playSound: true,
            onlyAlertOnce: true,
            groupAlertBehavior: GroupAlertBehavior.Children,
            importance: NotificationImportance.High,
            defaultPrivacy: NotificationPrivacy.Private,
            ledColor: Palette.primaryColor,
            channelShowBadge: true,
            criticalAlerts: true,
            defaultColor: Palette.primaryColor,
          )
        ],
        debug: false);
  }

  static notificaitonSetListeners() {
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onDismissActionReceivedMethod);
  }

  requestPermission() async {
    await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true);
  }

  onMessageListen() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        Map<String, String?>? payload =
            message.data.map((key, value) => MapEntry(key, value.toString()));
        localNotifications(
            message: message,
            chanelId: Random().nextInt(10).toString(),
            body: message.notification?.body,
            payload: payload);
      }
    });
  }

  static localNotifications(
      {required RemoteMessage message,
      String? body,
      var payload,
      required String? chanelId}) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            payload: payload,
            icon: null,
            criticalAlert: true,
            category: NotificationCategory.Status,
            id: int.parse(chanelId!),
            channelKey: 'YelloKiosk',
            title: 'YelloKiosk',
            body: body));
  }
}

class NotificationController {
  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    late var user = Users();
    var box = GetStorage();
    // user = Users.fromJson(jsonDecode(box.read("user")));
    // if (user.email!.isNotEmpty) {
    //   Get.offAll(() => const Home());
    //   Get.to(() => NotificationPage(users: user));
    //   Get.to(() => DetailNotification(
    //       title: receivedAction.payload!["title"]!,
    //       subtitle: receivedAction.payload!["subtitle"]!));
    // } else {
    //   // await locator.get<SignoutAccountService>().signout();
    // }
  }
}
