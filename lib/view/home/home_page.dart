import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Omar'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: controller.page[controller.currentIndex.value],
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.currentIndex.value,
              onTap: (value) => controller.currentIndex.value = value,
              items: const [
                BottomNavigationBarItem(
                    icon: HeroIcon(HeroIcons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: HeroIcon(HeroIcons.chatBubbleLeftRight), label: 'AI'),
                BottomNavigationBarItem(
                    icon: HeroIcon(HeroIcons.cog8Tooth), label: 'Settings'),
              ]),
        ));
  }
}
