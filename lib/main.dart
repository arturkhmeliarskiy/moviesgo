import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/home_bloc/home_bloc.dart';
import 'package:flutter_app/bottom_navigation/navigation.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:get_it/get_it.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:moviego_repositories/movies_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'ru']);
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetIt.instance.registerSingleton(MoviesRepository());
    GetIt.instance.registerFactory(() => HomeBloc());
    return LocaleBuilder(
        builder: (locale) => MaterialApp(
            localizationsDelegates: Locales.delegates,
            supportedLocales: Locales.supportedLocales,
            locale: locale,
            home: Navigation()));
  }
}
