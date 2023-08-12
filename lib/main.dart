import 'package:drift_database/category_card.dart';
import 'package:drift_database/local%20data/database.dart';
import 'package:drift_database/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drift Databse',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider()..init(),
          child: const MyHomePage(title: 'Flutter Demo Drift Database')),
    );
  }
}


