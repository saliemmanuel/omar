import 'dart:async';

import 'package:get/get.dart';

class BackgroundService extends GetxService {
  RxString backgroundData = ''.obs;

  void fetchDataInBackground() {
    // Exemple de tâche en arrière-plan
    Timer.periodic(Duration(seconds: 1), (timer) {
      backgroundData.value = 'Données mises à jour en arrière-plan $timer';
    });
  }
}
