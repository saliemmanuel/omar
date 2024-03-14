import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:url_strategy/url_strategy.dart';

import 'firebase/firebase_messaging.dart';
import 'firebase_options.dart';
import 'routes/routes.dart';
import 'view/splash/splash_bindings.dart';

void main() async {
  await GetStorage.init();
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseMessaging.instance.getInitialMessage();
  await FireMessageging().getTokenDeviceToken();
  await FireMessageging.initializeLocalNotifications();
  await FireMessageging.notificaitonSetListeners();
  FireMessageging().onMessageListen();
  FireMessageging().requestPermission();

  var box = GetStorage();
  if (box.read('theme') == 'dark') {
    Get.changeTheme(ThemeData.dark());
  } else {
    Get.changeTheme(ThemeData.light());
  }
  runApp(ShadApp(
    debugShowCheckedModeBanner: false,
    home: GetMaterialApp(
        initialRoute: "/",
        getPages: Routes.pages,
        initialBinding: SplashBindings(),
        title: "Omar",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          colorScheme: const ColorScheme.dark(),
        )),
    darkTheme: ShadThemeData(
      brightness: Brightness.dark,
      colorScheme: const ShadSlateColorScheme.light(),
    ),
  ));
}
