import 'package:flutter/material.dart';
import 'package:not_whatsapp/My%20Code/AddProfile_Page.dart';
import 'package:not_whatsapp/My%20Code/Settingspage.dart';
import 'package:not_whatsapp/Not%20Mycode/auth_page.dart';
import 'package:not_whatsapp/Not%20Mycode/contact_page.dart';
import 'package:not_whatsapp/Not%20Mycode/inbox.dart';
import 'package:not_whatsapp/Not%20Mycode/main_screen.dart';
import 'package:not_whatsapp/Not%20Mycode/splash_screen.dart';
import 'package:not_whatsapp/Not%20Mycode/story_view.dart';
import 'package:not_whatsapp/Not%20Mycode/welcome_screen.dart';
class RouteNames {
  static const String splashScreen = '/s';
  static const String mainScreen = '/mainScreen';
  static const String inbox = '/inbox';
  static const String storyPage = '/storyPage';
  static const String contactPage = '/contact';
  static const String welcome = '/welcome';
  static const String auth = '/auth';
  static const String settingsPage = '/settings';
  static const String addProfile = '/a';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SplashScreen());
      case RouteNames.addProfile:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const AddProfile());
      case RouteNames.mainScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const MainScreen());
      case RouteNames.inbox:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const Inbox(uid: '',));
      case RouteNames.storyPage:
        return MaterialPageRoute(
            settings: settings, builder: (_) => MyStoryPage());
      case RouteNames.contactPage:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ContactPage());
      case RouteNames.welcome:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const WelcomeScreen());
      case RouteNames.auth:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const AuthPage());
      case RouteNames.settingsPage:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const Settingpage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No Route Found ${settings.name}'),
            ),
          ),
        );
    }
  }
}
