import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platfrom_converter/provider/base_provider.dart';
import 'package:platfrom_converter/provider/setting_provider.dart';
import 'package:platfrom_converter/util/constant.dart';
import 'package:platfrom_converter/view/chat_view.dart';
import 'package:platfrom_converter/view/home_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences preferences;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  preferences = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, WidgetBuilder> routes = {
    Navigator.defaultRouteName: (context) => HomePage(),
    routeChatView: (context) => ChatView(),
  };

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BaseProvider()),
        ChangeNotifierProvider(create: (context) => SettingProvider()),
      ],
      builder: (context, child) {
        if (Provider.of<BaseProvider>(context).isAndroid) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(useMaterial3: true),
            darkTheme: ThemeData.dark(useMaterial3: true),
            themeMode: Provider.of<BaseProvider>(context).isDart ? ThemeMode.dark : ThemeMode.light,
            routes: routes,
          );
        } else {
          return CupertinoApp(
            debugShowCheckedModeBanner: false,
            theme: MaterialBasedCupertinoThemeData(
                materialTheme: Provider.of<BaseProvider>(context).isDart ? ThemeData.dark() : ThemeData.light()),
            routes: routes,
          );
        }
      },
    );
  }
}
