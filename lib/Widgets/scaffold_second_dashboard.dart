
import 'dart:developer';
import 'dart:io';

import 'package:club_and_resort/Views/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import '../Constants/const.dart';
import '../Utils/local_auth_fingerprint.dart';
import '../Utils/providers.dart';
import '../Utils/shared_preferences.dart';
import 'bottom_navbar_custom.dart';
import 'custom_blur_effect.dart';
import 'custom_drawer.dart';

class ScaffoldSecondDashboard extends StatefulWidget {
  ScaffoldSecondDashboard({
    super.key,
    this.mainBody,
    this.pageTitle,
    this.isChatIconShown=true

  });
  final Widget? mainBody;
  String? pageTitle;
  bool? isChatIconShown;

  @override
  State<ScaffoldSecondDashboard> createState() => _ScaffoldSecondDashboardState();
}

class _ScaffoldSecondDashboardState extends State<ScaffoldSecondDashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<BiometricType> bioMetricType = [];

  getBioMetricType() async {
    bioMetricType = await LocalAuthFingerprint.biometricType();

    if (mounted) {
      setState(() {});

      if(AppSharedPreferences.getBioPopupValue()){
        addRemoveBiometric();
      }

    }
  }

  void matchFingerPrint() async {
    String bioType =
    bioMetricType.contains(BiometricType.face) ? "FaceID" : "Fingerprint";

    bool auth = await LocalAuthFingerprint.authenticate();
    if (auth) {
      AppSharedPreferences.setBioPopupValue(false);
      AppSharedPreferences.setBioRegistered(true);
      setState(() {});
      CustomToast.showTopToast(context: context, msg: "$bioType registered successfully.", iconName:
      bioMetricType.contains(BiometricType.face)
          ? "faceid"
          : "fingerprint",
          bgColor: CustomAppColors.successColor);
    } else {
      AppSharedPreferences.setBioPopupValue(false);
      AppSharedPreferences.setBioRegistered(false);
      setState(() {});
    }
  }

  void removeFingerprint() {
    String bioType =
    bioMetricType.contains(BiometricType.face) ? "FaceID" : "Fingerprint";

    AppSharedPreferences.setBioRegistered(false);
    setState(() {});

    CustomToast.showTopToast(context: context, msg: "$bioType removed successfully.", iconName:

    bioMetricType.contains(BiometricType.face)
        ? "faceid"
        : "fingerprint",

        bgColor: CustomAppColors.successColor);
  }

  @override
  void initState() {
    super.initState();
    getBioMetricType();
  }
  @override
  Widget build(BuildContext context) {


    if (widget.mainBody == null) {
      widget.pageTitle = Provider.of<OurProviderClass>(context, listen: false).getPageTitle;
    }


    return PopScope(
      canPop: false,

      // canPop: Provider.of<OurProviderClass>(context).getIndex ==0,
      //
      // onPopInvokedWithResult: (didPop, result) {
      //   if (didPop) {
      //     log('User navigated back');
      //   } else {
      //     Provider.of<OurProviderClass>(context, listen: false).changeBottomNavBarIndex(0);
      //     Provider.of<OurProviderClass>(context, listen: false).changeAppBarTitle('');
      //     log('Back navigation was prevented');
      //   }
      // },

      child: Stack(
        children: [
          Scaffold(
            onDrawerChanged: (isOpen) {
              log('isOpen.toString()');
              log(isOpen.toString());
              Provider.of<OurProviderClass>(context, listen: false).showBlurEffectSecondOnBody(isOpen);
            },
            backgroundColor: CustomAppColors.scaffoldBackgroundColor,
            drawerScrimColor: Colors.transparent,
            drawer: customDrawer(context),

            key: _scaffoldKey,

            appBar: AppBar(
              backgroundColor: Colors.white,
              scrolledUnderElevation: 0,
              automaticallyImplyLeading: false,
              flexibleSpace: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.only(left: 10, top: 40),
                      decoration: const BoxDecoration(
                        color: CustomAppColors.whiteSecond,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: !ModalRoute.of(context)!.isFirst ||
                            Provider.of<OurProviderClass>(context, listen: false).getIndex == 2 ||
                            Provider.of<OurProviderClass>(context, listen: false).getIndex == 3
                            ? IconButton(
                          splashRadius: 20,
                          icon: const ImageIcon(
                            AssetImage("assets/icons/back_arrow.png"),
                            color: CustomAppColors.blackColor,
                            size: 20,
                          ),
                          onPressed: () {
                            if (!ModalRoute.of(context)!.isFirst) {
                              Navigator.pop(context);
                            } else if (Provider.of<OurProviderClass>(context, listen: false).getIndex == 2 ||
                                Provider.of<OurProviderClass>(context, listen: false).getIndex == 3) {
                              Provider.of<OurProviderClass>(context, listen: false).changeBottomNavBarIndex(0);
                              Provider.of<OurProviderClass>(context, listen: false).changeAppBarTitle('');
                            }
                          },
                        )
                            : IconButton(
                          splashRadius: 20,
                          icon: const ImageIcon(
                            AssetImage("assets/icons/drawer.png"),
                            color: CustomAppColors.blackColor,
                            size: 20,
                          ),
                          onPressed: () {
                            _scaffoldKey.currentState?.openDrawer();
                          },
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        '${widget.pageTitle}',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: CustomAppColors.whiteColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  if (Provider.of<OurProviderClass>(context, listen: false).getIndex != 3 &&
                      Provider.of<OurProviderClass>(context, listen: false).getIndex != 2 &&
                      widget.isChatIconShown!)
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: const EdgeInsets.only(right: 10, top: 40),
                        decoration: BoxDecoration(
                          color: CustomAppColors.whiteSecond,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          splashRadius: 20,
                          icon: const ImageIcon(
                            AssetImage("assets/icons/bell.png"),
                            color: CustomAppColors.blackColor,
                            size: 20,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  if(Provider.of<OurProviderClass>(context, listen: false).getBlurEffectSecondOnBody==true)CustomBlurEffect(showLoading: false,),

                ],
              ),
            ),




            // appBar: AppBar(
            //     backgroundColor: Colors.transparent,
            //     // title: Text("data"),
            //     systemOverlayStyle: SystemUiOverlayStyle.dark
            // ),



            bottomNavigationBar: SizedBox(
              height: Platform.isIOS
                  ? MediaQuery.of(context).size.height * 0.11
                  : MediaQuery.of(context).size.height * 0.08,
              child: Stack(
                children: [
                  BottomNavigationBarCustomDashboard(
                    onItemTapped: (index) {
                      Provider.of<OurProviderClass>(context, listen: false)
                          .changeBottomNavBarIndex(index);

                      Provider.of<OurProviderClass>(context, listen: false)
                          .changeAppBarTitle(
                        widget.pageTitle = index == 0
                            ? ""
                            : index == 1
                            ? ""
                            : index == 2
                            ? ConstStrings.homeScreenTitle
                            : index == 3
                            ? ConstStrings.paymentScreenTitle
                            : "",
                      );

                      if (widget.mainBody != null) {
                        Navigator.of(context).popUntil((route) {
                          return route.settings.name == ConstStrings.scaffoldRouteName;
                        });
                      }
                    },
                  ),

                  if (Provider.of<OurProviderClass>(context, listen: false).getBlurEffectSecondOnBody == true)
                    CustomBlurEffect(showLoading: false),
                ],
              ),
            ),


            resizeToAvoidBottomInset: false,
            // resizeToAvoidBottomInset: true,
            // extendBody: true,
            // appBar: AppBar(backgroundColor: Colors.transparent,),
            // appBar: AppBar(
            //   backgroundColor: Colors.white,
            // ),
            body: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: 20,
              ),
              child: Stack(
                children: [
                  widget.mainBody ??
                      IndexedStack(
                        index: Provider.of<OurProviderClass>(context).getIndex,
                        children: AppScreens().screenLst,
                      ),

                  if (Provider.of<OurProviderClass>(context).getBlurEffectSecondOnBody == true)
                    CustomBlurEffect(showLoading: false,),

                  // You can add more overlay widgets here if needed.
                ],
              ),
            ),


          ),

          if(Provider.of<OurProviderClass>(context, listen: false).getBlurEffectSecond==true)CustomBlurEffect(),
          if(Provider.of<OurProviderClass>(context, listen: false).getBlurEffectFirst==true)CustomBlurEffect(),

        ],
      ),
    );
  }

  addRemoveBiometric(){

    String bioType =
    bioMetricType.contains(BiometricType.face) ? "FaceID" : "Fingerprint";

    ConstFunctions.showDialogBox(

      context: context,

      title: AppSharedPreferences.getBioRegistered() == true

          ? 'Do you want to Remove $bioType?'
          : 'Do you want to Add $bioType?',

      iconName: bioMetricType.contains(BiometricType.face)
          ? 'faceid'
          : 'fingerprint',

      yes: (){
        Navigator.pop(context);
        AppSharedPreferences.setBioPopupValue(false);
        // showAlertDialogBiometric = false;
        if (AppSharedPreferences.getBioRegistered() == true) {
          removeFingerprint();
        } else {
          matchFingerPrint();
        }
      },
      no: (){
        Navigator.pop(context);
        AppSharedPreferences.setBioPopupValue(false);
        // showAlertDialogBiometric = false;
      },
    );
  }


  Widget customDrawer(BuildContext context) {

    return Drawer(
      width: MediaQuery.of(context).size.width * 0.70,
      backgroundColor: CustomAppColors.scaffoldBackgroundColor.withValues(alpha: 0.85),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: CustomInkWell(
                  onPress: () {
                    Navigator.pop(context);
                  },
                  childWidget: const ImageIcon(
                    AssetImage("assets/icons/close_drawer.png"),
                    color: CustomAppColors.blackColor,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: CircleAvatar(
                        backgroundColor: CustomAppColors.blackColor,
                        radius: 40,
                        backgroundImage: AssetImage('assets/images/image4.png'),
                      ),
                    ),
                    SizedBox(height: 10,),
                    const Divider(
                      thickness: 0.5,
                      // thickness: 1,
                    ),
                    const SizedBox(height: 10),

                    DrawerListElement(
                      onPress: () {

                      },
                      iconPath: "assets/icons/home.png",

                      title: 'Home',
                    ),
                    DrawerListElement(
                      onPress: () {
                      },
                      iconPath: "assets/icons/chat.png",

                      title: 'Chat',
                    ),
                    DrawerListElement(
                      onPress: () {
                      },
                      iconPath: "assets/icons/history.png",

                      title: 'History',
                    ),
                    DrawerListElement(
                      onPress: () {
                        Navigator.pop(context);
                        Provider.of<OurProviderClass>(context, listen: false).changeBottomNavBarIndex(3);
                      },
                      iconPath: "assets/icons/profile.png",

                      title: 'Profile',
                    ),
                    DrawerListElement(
                      onPress: () {
                        Navigator.pop(context);
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentOptionsScreen(),));
                      },
                      iconPath: "assets/icons/payment.png",


                      title: 'Payment',
                    ),


                    bioMetricType.isEmpty
                        ? Container()
                        : DrawerListElement(
                      onPress: () {

                        Navigator.pop(context);

                        AppSharedPreferences.setBioPopupValue(true);

                        addRemoveBiometric();
                      },
                      iconPath:
                      bioMetricType.contains(BiometricType.face)
                          ? "assets/icons/faceid.png"
                          : "assets/icons/fingerprint.png",
                      title: bioMetricType
                          .contains(BiometricType.face)
                          ? "${AppSharedPreferences.getBioRegistered() == true ? 'Remove' : 'Add'} FaceID"
                          : "${AppSharedPreferences.getBioRegistered() == true ? 'Remove' : 'Add'} Fingerprint",
                    ),




                  ],
                ),
              ),

              DrawerListElement(
                onPress: () {
                  Navigator.pop(context);


                  ConstFunctions.showDialogBox(context: context,
                    title: "Do you want to Logout ?",
                    iconName: "logout",
                    yes: (){
                      Navigator.pop(context);
                      logOutFunction();
                    },
                    no: (){
                      Navigator.pop(context);
                    },
                  );
                },
                iconPath: "assets/icons/logout.png",
                iconColor: CustomAppColors.primaryColor,
                title: 'Logout',
              ),

            ],
          ),
        ),
      ),
    );
  }


  void logOutFunction() async {

    Provider.of<OurProviderClass>(context, listen: false).showBlurEffectSecond(true);

    AppSharedPreferences.clearSpecificPreferences();

    Provider.of<OurProviderClass>(context, listen: false).changeBottomNavBarIndex(0);
    await Future.delayed(const Duration(milliseconds: 500));
    Provider.of<OurProviderClass>(context, listen: false).showBlurEffectSecond(false);

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => const SignInScreen()),
            (Route<dynamic> route) => false);

    await Future.delayed(const Duration(milliseconds: 500));
    // UserDetailMDL.resetMeModelObject();


  }

}






