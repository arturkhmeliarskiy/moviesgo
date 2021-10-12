import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/home_bloc/home_bloc.dart';
import 'package:flutter_app/bottom_navigation/navigation.dart';
import 'package:flutter_app/colors/movie_color.dart';
import 'package:flutter_app/theme/theme_provider.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:get_it/get_it.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:moviego_repositories/movies_repository.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'ru']);
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    GetIt.instance.registerSingleton(MoviesRepository());
    GetIt.instance.registerFactory(() => HomeBloc());
  }

  @override

  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return LocaleBuilder(
            builder: (locale) => MaterialApp(
                themeMode: themeProvider.themeMode,
                theme: MyTheme.lightTheme,
                darkTheme: MyTheme.darkTheme,
                localizationsDelegates: Locales.delegates,
                supportedLocales: Locales.supportedLocales,
                locale: locale,
                home: Navigation()));
      });
}
