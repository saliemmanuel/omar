import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../config/palette.dart';
import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff3371FF),
                Color(0xff8426D6),
              ],
            ),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 6),
              AutoSizeText(
                controller.name,
                maxLines: 1,
                style:
                    TextStyle(fontSize: 30.0, color: Palette.textFooterColors),
              ),
              const Spacer(flex: 3),
              const CupertinoActivityIndicator(),
              const SizedBox(height: 25.0),
              Text(
                "From Maroua IT",
                style: TextStyle(color: Palette.textFooterColors),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
