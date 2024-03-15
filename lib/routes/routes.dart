import 'package:get/get.dart';
import 'package:omar/view/about/about_bindings.dart';
import 'package:omar/view/liste_periode/liste_periode_bindings.dart';
import 'package:omar/view/liste_periode/more_detail_periode/more_detail_periode_page.dart';
import 'package:omar/view/settings/more_notification_settings/more_notification_settings_page.dart';

import '../view/about/about_page.dart';
import '../view/home/home_bindings.dart';
import '../view/home/home_page.dart';
import '../view/liste_periode/liste_periode_page.dart';
import '../view/liste_periode/more_detail_periode/more_detail_periode_bindings.dart';
import '../view/login/login_bindings.dart';
import '../view/login/login_page.dart';
import '../view/settings/more_notification_settings/more_notification_settings_bindings.dart';
import '../view/signup/signup_bindings.dart';
import '../view/signup/signup_page.dart';
import '../view/splash/Splash_bindings.dart';
import '../view/splash/splash_page.dart';

class NamePageRoute {
  static String splash = "/";
  static String login = "/login";
  static String signup = "/signup";
  static String about = "/about";
  static String home = "/home";
  static String periode = "/periode";
  static String detailPeriode = "/detailPeriode";
  static String moreNotificationSettings = "/moreNotificationSettings";
}

class Routes {
  static List<GetPage<dynamic>>? pages = [
    GetPage(
        transition: Transition.fadeIn,
        name: NamePageRoute.splash,
        binding: SplashBindings(),
        page: () => const SplashPage(),
        children: [
          GetPage(
            transition: Transition.fadeIn,
            name: NamePageRoute.login,
            binding: LoginBindings(),
            page: () => const LoginPage(),
          ),
          GetPage(
            transition: Transition.fadeIn,
            name: NamePageRoute.signup,
            binding: SignupBindings(),
            page: () => const SignupPage(),
          ),
          GetPage(
            transition: Transition.fadeIn,
            name: NamePageRoute.home,
            binding: HomeBindings(),
            page: () => const HomePage(),
          ),
          GetPage(
            transition: Transition.fadeIn,
            name: NamePageRoute.about,
            binding: AboutBindings(),
            page: () => const AboutPage(),
          ),
          GetPage(
            transition: Transition.fadeIn,
            name: NamePageRoute.periode,
            binding: ListePeriodeBindings(),
            page: () => const ListePeriodePage(),
          ),
          GetPage(
            transition: Transition.fadeIn,
            name: NamePageRoute.detailPeriode,
            binding: MoreDetailPeriodeBindings(),
            page: () => const MoreDetailPeriodePage(),
          ),
          GetPage(
            transition: Transition.fadeIn,
            name: NamePageRoute.moreNotificationSettings,
            binding: MoreNotificationSettingsBindings(),
            page: () => const MoreNotificationSettingsPage(),
          ),
        ]),
  ];
}
