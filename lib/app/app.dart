import 'package:budgetbuddy/presentation/screens/IntroScreen.dart';
import 'package:budgetbuddy/presentation/widgets/CustomScroll.dart';
import 'package:flutter/material.dart';

import '../presentation/screens/HomePage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: CustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Budget Buddy',
      theme: ThemeData(
        fontFamily: 'Plus Jakarta Sans',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const Introscreen(),
      routes: {
        '/home': (context) => HomePage(),
        // '/accounts': (context) => AccountsPage(),
        // '/transactions': (context) => TransactionPage(),
      },
    );
  }
}