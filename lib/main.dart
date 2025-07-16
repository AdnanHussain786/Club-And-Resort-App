import 'package:club_and_resort/Views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'Utils/providers.dart';
import 'Utils/shared_preferences.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // Stripe.publishableKey = ConstStrings.stripePublisherKey;

  await AppSharedPreferences.init();

  runApp(
    ChangeNotifierProvider(
      create: (_) => OurProviderClass(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:Brightness.dark,
      systemNavigationBarColor: Colors.black.withValues(alpha: 0.002),
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

