import 'package:club_and_resort/Views/calendar_screen.dart';
import 'package:club_and_resort/Views/home_screen.dart';
import 'package:club_and_resort/Views/payment_screen.dart';
import 'package:club_and_resort/Views/search_screen.dart';
import 'package:club_and_resort/Views/tools_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../Utils/shared_preferences.dart';
import '../Widgets/custom_text_button.dart';

class CustomAppColors {
  static const Color blackColor = Colors.black;
  static const Color whiteColor = Colors.white;
  static const Color successColor = Colors.green;
  static const Color whiteSecond = Color(0xFFF7FAFC);
  static const Color redColor = Colors.red;
  static Color primaryColor = Color(int.parse(AppSharedPreferences.getPrimaryColor()));
  static Color secondaryColor = Color(int.parse(AppSharedPreferences.getSecondaryColor()));
  static Color darkLightColor = AppSharedPreferences.getIsDarkMode()!? CustomAppColors.whiteColor :CustomAppColors.blackColor;
  static const Color iconDimColor =  Color(0x15000000);
  static const Color greyColor =  Color(0xFFEFECE8);
  static const Color blackColorForFieldsBorders =  Color(0xFF776F69);
  static const Color creamBackgroundScaffold =  Color(0xFFFFEEDE);
  static const Color yellowBackground =  Color(0xFFFFE5CA);
  static const Color pinkColor =  Color(0xFF4A739C);
  static const Color greyColor2 =  Color(0xFFB2B2B2);
  static const Color scaffoldBackgroundColor =  Color(0xFFF7F3ED);
  static const Color grey3 =  Color(0xFF776F69);


}

class AppScreens {
  List<Widget> get screenLst => [
    HomeScreen(),
    CalendarScreen(),
    PaymentScreen(),
    SearchScreen(),
    ToolsScreen()

    // TutorialScreen(),
  ];
}


class ConstStrings{

  static const String scaffoldRouteName = "ScaffoldRouteName";
  static const String homeScreenTitle = "Home";
  static const String calemdarScreenTitle = "Home";
  static const String paymentScreenTitle = "Payment";
  static const String searchScreenTitle = "Search";
  static const String toolsScreenTitle = "Tools";

}

class CustomTextStyles{
  static TextStyle title12DarkLightBold = TextStyle(
    color: CustomAppColors.darkLightColor,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static TextStyle grey14Normal = TextStyle(
    color: CustomAppColors.blackColorForFieldsBorders,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle grey10Normal = TextStyle(
    color: CustomAppColors.greyColor2,
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );



  static TextStyle title14WhiteBold = TextStyle(
    color: CustomAppColors.whiteColor,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );


  static TextStyle title14PinkBold = TextStyle(
    color: CustomAppColors.pinkColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle blackText14Bold = TextStyle(
    color: CustomAppColors.blackColor,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static TextStyle blackText14Normal = TextStyle(
    color: CustomAppColors.blackColor,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static TextStyle title12BlackBold = TextStyle(
    color: CustomAppColors.blackColor,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static TextStyle blackText16Bold = TextStyle(
    color: CustomAppColors.blackColor,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static TextStyle blackText16Bold600 = TextStyle(
    color: CustomAppColors.grey3,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle title20BlackBold = TextStyle(
    color: CustomAppColors.blackColor,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static TextStyle grey12 = TextStyle(
    color: CustomAppColors.greyColor2,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static TextStyle title28BlackFullBold = TextStyle(
    color: CustomAppColors.blackColor,
    fontSize: 28,
    fontWeight: FontWeight.w700,
  );
}

class ConstFunctions{

  static showDialogBox({required BuildContext context,required Function yes,required Function no,required String iconName, required String title}){
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: CustomAppColors.primaryColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top icon

              ImageIcon(
                // AssetImage('assets/icons/logout.png'),
                AssetImage('assets/icons/$iconName.png'),
                color: CustomAppColors.primaryColor,
                size: 35,
              ),

              const SizedBox(height: 16),

              // Message
              // Text("Do you want to Logout ?",
              Text(title,
                textAlign: TextAlign.center,
                style: CustomTextStyles.title12DarkLightBold,
              ),
            ],
          ),

          actions: [
            CustomTextButton(
              btnTitle: "No",
              btnPress: (){
                // Navigator.pop(context);
                no();
              },
            ),
            CustomTextButton(
              btnTitle: "Yes",
              btnPress: (){
                // Navigator.pop(context);
                // logOutFunction();
                yes();
              },
            ),

          ],

        );
      },
    );
  }
}

class CustomToast {
  static void showToast({
    required String message,
    Color? bgColor,
    Color? txtColor,
  }) {
    Fluttertoast.showToast(
        textColor: txtColor ?? CustomAppColors.whiteColor,
        backgroundColor: bgColor ?? CustomAppColors.redColor,
        msg: message,
        gravity: ToastGravity.CENTER);
  }


  static void showTopToast({required BuildContext context,required String msg,Color? bgColor,required String iconName}){
    return showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: msg,
        backgroundColor: bgColor ?? CustomAppColors.redColor,
        textStyle: CustomTextStyles.title14WhiteBold,
        icon: ImageIcon(AssetImage("assets/icons/$iconName.png"),size: 120,color: CustomAppColors.iconDimColor),
        maxLines: 4,
      ),
    );
  }


}

class ConstValues{
  static const double heightOfTextField = 56;
  static const double heightOfSearchField = 47;

  static const double bodyLarge28 = 28;

  static const EdgeInsetsGeometry textFieldsMargins = EdgeInsets.fromLTRB(0, 0, 0, 15);


  static const double additionalBottomPaddingOfIOS = 90;
  static const double bottomPaddingOfAndroid = kBottomNavigationBarHeight + 30;





}