import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:omar/routes/routes.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import './login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Omar'),
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: [
                const Text(
                  'Bienvenue',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 13),
                const Text.rich(
                  TextSpan(
                    text: 'Omar ',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text:
                            "vous souhaite la bienvenue chez vous. Entrez un email et un mot de passe pour vous connecter.",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ShadInput(
                          style: TextStyle(
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black),
                          controller: controller.email,
                          padding: const EdgeInsets.all(12),
                          placeholder: Text(
                            'E-mail',
                            style: TextStyle(
                                color: Get.isDarkMode
                                    ? Colors.grey
                                    : Colors.black),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        ShadInput(
                            controller: controller.password,
                            obscureText: true,
                            style: TextStyle(
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black),
                            padding: const EdgeInsets.all(12),
                            placeholder: Text(
                              'Mot de passe',
                              style: TextStyle(
                                  color: Get.isDarkMode
                                      ? Colors.grey
                                      : Colors.black),
                            )),
                        const SizedBox(height: 20),
                        Center(
                          child: ShadButton(
                            width: Get.width,
                            text: const Text('Connexion'),
                            onPressed: () {
                              if (controller.email.text.isEmpty ||
                                  controller.password.text.isEmpty) {
                                Get.snackbar('Error',
                                    'Veuillez renseigner tous les champs');
                              } else {
                                controller.connexion(context: Get.context);
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () => Get.toNamed(NamePageRoute.signup),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Vous n'avez pas de compte?",
                                  style: TextStyle(fontSize: 12)),
                              TextButton(
                                  onPressed: () {
                                    Get.toNamed(NamePageRoute.signup);
                                  },
                                  child: const Text('Créer un compte',
                                      style: TextStyle(fontSize: 12)))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
