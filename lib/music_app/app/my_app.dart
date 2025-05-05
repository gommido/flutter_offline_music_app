import 'package:flutter/material.dart';
import '../core/constants/app_strings.dart';
import '../presentation/pages/home_page/home_page.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      home:  HomePage(),
    );
  }
}
