import 'package:club_and_resort/Constants/const.dart';
import 'package:club_and_resort/Views/sign_in_screen.dart';
import 'package:flutter/material.dart';

import '../Utils/check_internet_connection.dart';
import '../Utils/shared_preferences.dart';
import '../Widgets/scaffold_first.dart';
import '../Widgets/scaffold_second_dashboard.dart';
import '../Widgets/screen_navigation_slide.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  int subtractHours = 5;


  @override
  void initState() {
    super.initState();

    checkInternetConnectivity();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    Future.delayed(const Duration(milliseconds: 500), () {
      _fadeController.forward();
    });

  }

  checkInternetConnectivity() async {

    // AppSharedPreferences.setBioPopupValue(false);

    if (await checkInternet()) {

      await Future.delayed(Duration(seconds: 2));

      // Navigator.pushReplacement(
      //   context,
      //   ScreenNavigationSlide(page:  SignInScreen()),
      // );


      if (AppSharedPreferences.getUserToken() != '' &&
          DateTime.now().isBefore(DateTime.parse(
              AppSharedPreferences.getExpTime() ??
                  DateTime.now().toString())
              .subtract(Duration(hours: subtractHours)))) {

        // UserDetailMDL.initialize(
        //   email: AppSharedPreferences.getEmail(),
        //   userName: AppSharedPreferences.getUsername(),
        // );



        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => ScaffoldSecondDashboard(),
            settings: const RouteSettings(name: ConstStrings.scaffoldRouteName),
          ),
              (Route<dynamic> route) => false,
        );

      } else {

        await Future.delayed(Duration(seconds: 2));

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SignInScreen()),
        );

      }

    }
    else {
      // Future.delayed(const Duration(seconds: 2), () async {
      //   Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(builder: (context) => const NoInternet()),
      //   );
      // });
    }
  }


  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldFirst(
      showBottomIns: false,
      mainBody: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Hero(
            tag: "logo",
            child: Image.asset(
              "assets/logo/logo.png",
              color: CustomAppColors.blackColor,
              width: MediaQuery.of(context).size.width / 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
