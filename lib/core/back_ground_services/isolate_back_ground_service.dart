import 'dart:async';
import 'dart:isolate';

void startBackgroundTask(SendPort sendPort) {
  Timer.periodic(const Duration(seconds: 1), (time) {
    sendPort.send('Données mises à jour en arrière-plan');
  });
}

class BackgroundIsolate {
  static void runBackgroundTask() async {
    ReceivePort receivePort = ReceivePort();
    Isolate.spawn(startBackgroundTask, receivePort.sendPort);
    receivePort.listen((data) {});
  }
}
