import 'package:flutter/material.dart';
import 'package:localization_app/getX/controllers/locale_controller.dart';
import 'package:get/get.dart';
import 'Localization/app_localization.dart';
import 'getX/views/page/localization_app_page.dart';


void main() {
  runApp(  MyApp());
}



class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final controller = Get.put(LocaleController());
  static GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) =>
      GetX<LocaleController>(
        builder: (LocaleController localeController)=>MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primaryColor: Colors.deepPurpleAccent,
          ),
          locale: localeController.locale.value,
          //locale: Locale('en'),
          supportedLocales: AppLocalization.all,
          localizationsDelegates: AppLocalization.localizationsDelegates,
          home: MainPage(),
        ),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
    body:LocalizationAppPage(),
  );

}