import 'package:flutter/material.dart';
import 'package:period_and_pregnancy_app/pages/homepage.dart';
import 'package:period_and_pregnancy_app/provider/period_provider.dart';
import 'package:period_and_pregnancy_app/provider/pregnancy_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => PeriodProvider()),
          ChangeNotifierProvider(create: (_) => PregnancyProvider()),
        ],
        child: MaterialApp(
          home: Homepage(),
        ));
  }
}
