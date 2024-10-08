import 'package:delegate/provider/client_provider.dart';
import 'package:delegate/provider/profile_provider.dart';
import 'package:delegate/provider/start_visit_provider.dart';
import 'package:delegate/screen/Visit%20history/Visit%20history_view.dart';
import 'package:delegate/screen/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'core/helper/cache_helper.dart';
import 'core/helper/di.dart';
import 'custom_widget/drewnavbar.dart';
import 'l10n/l10n.dart';
import 'localization/localprovider/locale_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLoactor();
  await sl<CacheHelper>().init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) =>
      LocaleProvider(context: context)
        ..init(),
      lazy: true,
    ),
    ChangeNotifierProvider(
        create: (context) => StartVisitProvider(context: context)),
    ChangeNotifierProvider(
        create: (context) => ClientProvider(context: context)),
    ChangeNotifierProvider(
        create: (context) => ProfileProvider(context: context)),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _user;

  get user => _user;

  set user(value) {
    _user = value;
    setState(() {});
  }

  checkUser({required BuildContext context}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    user = sharedPreferences.getString('user_id');
  }

  @override
  var address;
  var lat;
  var lng;

  void initState() {
    checkUser(context: context)
    ;
    getCurrentLocation().then((value) async {
      print('${value.latitude}********${value.longitude}');
      lat = value.latitude;
      lng = value.longitude;

      print(address.toString());

      setState(() {});
    });

    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Consumer<LocaleProvider>(
          builder: (context, provider, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(useMaterial3: false, fontFamily: "Cairo"),
              home: user == null ? LoginView() : DrewNavigationBar(),
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              locale: provider.locale,
              supportedLocales: L10n.all,
            );
          },
        );
      },
    );
  }
}

Future<Position> getCurrentLocation() async {
  await Geolocator.requestPermission()
      .then((value) {})
      .onError((error, stackTrace) {
    print('error is $error');
  });
  return await Geolocator.getCurrentPosition();
}
