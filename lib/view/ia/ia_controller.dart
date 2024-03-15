import 'package:get/get.dart';

class IaController extends GetxController {
  @override
  void onInit() {
    okGoogle();
    super.onInit();
  }

  okGoogle() async {
    // final model = GenerativeModel(
    //     model: 'gemini-pro', apiKey: dotenv.env['GenerativeApiKey']!);
    // const prompt = 'Write a story about a magic backpack.';
    // final content = [Content.text(prompt)];
    // final response = await model.generateContent(content);

    // print(response.text);
  }
}
