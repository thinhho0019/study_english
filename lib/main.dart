import 'package:flutter/material.dart';
import 'package:flutter_study_english/provider/provider_timenext.dart';
import 'package:flutter_study_english/ui/ui_logo.dart';
import 'package:flutter_study_english/ui/ui_manghinhchinh.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => providerTimeNext())],
      child: MaterialApp(
          title: 'Study_English',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: mainLogo()),
    );
  }
}
