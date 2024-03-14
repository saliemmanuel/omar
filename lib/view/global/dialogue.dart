import 'package:fluid_dialog/fluid_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

simpleDialog({
  required BuildContext context,
  required String message,
  required Widget confirmButton,
  required Widget cancelButton,
  String title = "Error",
}) {
  Get.bottomSheet(
    Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(15.0),
          margin: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Get.isDarkMode ? Colors.grey.shade800 : Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold))
              ]),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(message),
                    ),
                  ),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [confirmButton, cancelButton])
            ],
          ),
        )
      ],
    ),
  );
}

bottomSheetExit(BuildContext context,
    {String? title, VoidCallback? onConfirm, VoidCallback? onCancel}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 32),
    height: 150,
    decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title!,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ShadButton(
              backgroundColor: Colors.red,
              text: const Text('Non'),
              onPressed: onCancel,
            ),
            const SizedBox(width: 20),
            ShadButton(
              text: const Text('Oui'),
              onPressed: onConfirm,
            ),
          ],
        )
      ],
    ),
  );
}

simpleDialogueCardSansTitles(BuildContext context) {
  Get.dialog(const AlertDialog(content: CircularProgressIndicator()));
}

simpleDialogueCardSansTitle(String msg, BuildContext context) {
  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.all(15.0),
      height: Get.height * 0.1,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Get.isDarkMode ? Colors.grey.shade800 : Colors.white,
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(width: 15.0),
          Expanded(child: Text(msg))
        ],
      ),
    ),
  );

  // Get.dialog(
  //   Padding(
  //     padding: const EdgeInsets.only(top: 7.0),
  //     child: Row(
  //       children: [
  //         const CircularProgressIndicator(),
  //         const SizedBox(width: 15.0),
  //         Expanded(child: Text(msg))
  //       ],
  //     ),
  //   ),
  // );
  //  showDialog(
  //     barrierDismissible: false,
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         content:
  //       );
  //     });
}

class SecondDialogPage extends StatelessWidget {
  const SecondDialogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'And a bigger dialog',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(
              onPressed: () => DialogNavigator.of(context).pop(),
              child: const Text('Go back'),
            ),
            TextButton(
              onPressed: () => DialogNavigator.of(context).close(),
              child: const Text('Close the dialog'),
            ),
          ],
        ),
      ),
    );
  }
}
