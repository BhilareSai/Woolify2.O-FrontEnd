import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woolify/Other/FireBaseNotification.dart';
import 'package:woolify/Router/GoRouter.dart';
import 'package:woolify/Theme/ThemeData.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseNotifiApi().initNotification();
  runApp(const ProviderScope(child: Woolify()));
}

myThemeData themeData = myThemeData();
final route = MyGoRouter();

class Woolify extends StatelessWidget {
  const Woolify({super.key});

  @override
  Widget build(context) {
    return MaterialApp.router(
      routeInformationParser: route.router.routeInformationParser,
      routeInformationProvider: route.router.routeInformationProvider,
      routerDelegate: route.router.routerDelegate,
      theme: themeData.lightTheme,
      darkTheme: themeData.darkTheme,
      themeMode: themeData.themeMode,
    );
  }
}
