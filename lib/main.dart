import 'package:flutter/material.dart';
import 'package:healthy_mind_application/core/routes/Navigators.dart';
import 'package:healthy_mind_application/core/themes/AppMaterialColors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Healthy Mind Application',
      theme: ThemeData(primarySwatch: MaterialColors.primarySwatch),
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
