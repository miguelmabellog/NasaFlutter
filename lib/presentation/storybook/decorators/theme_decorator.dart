import 'package:flutter/material.dart';
import 'package:nasa_flutter/config/theme/app_theme.dart';

Widget withAppTheme(BuildContext context, Widget child) {
  return MaterialApp(
    theme: AppTheme.lightTheme,
    darkTheme: AppTheme.darkTheme,
    themeMode: ThemeMode.system,
    home: Scaffold(body: Center(child: child)),
    debugShowCheckedModeBanner: false,
  );
}
