import 'package:flutter/material.dart';
import 'package:toko_rame/detail_produk_page.dart';
import 'package:toko_rame/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) =>  const OnboardingPage(),
        '/onboarding-page': (context) => const OnboardingPage(),
        '/detail-produk-page': (context) => const DetailProdukPage(),
      },
    );
  }
}
