import 'dart:io';
import 'package:club_and_resort/Views/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import '../Constants/const.dart';
import '../Utils/local_auth_fingerprint.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/custom_drawer.dart';
import '../Widgets/custom_textform_field.dart';
import '../Widgets/scaffold_first.dart';
import '../Widgets/scaffold_second_dashboard.dart';
import '../Widgets/screen_navigation_slide.dart';
import 'forgot_password_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}



class _SignInScreenState extends State<SignInScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  List<BiometricType> bioMetricType = [];

  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  bool showBiometricPopup = false;


  @override
  void initState() {
    super.initState();
    getBioMetricType();
  }

  getBioMetricType() async {

    bioMetricType = await LocalAuthFingerprint.biometricType();
    setState(() {});
  }


  // signInWithBiometric() async {
  //   FocusScope.of(context).requestFocus(FocusNode());
  //
  //   if (AppSharedPreferences.getEmail() != null &&
  //       AppSharedPreferences.getPassword() != null &&
  //       AppSharedPreferences.getBioRegistered() == true) {
  //     AppSharedPreferences.setBioPopupValue(false);
  //     final isAuthenticated = await LocalAuthFingerprint.authenticate();
  //     if (isAuthenticated && mounted) {
  //
  //       setState(() {
  //         Provider.of<OurProviderClass>(context, listen: false).showBlurEffectFirst(true);
  //       });
  //
  //       // setState(() {
  //       //   isLoading = true;
  //       // });
  //
  //       SignInModelClass signInModelClass = SignInModelClass(email: AppSharedPreferences.getEmail()!, password: AppSharedPreferences.getPassword()!);
  //
  //       bool isSignInSuccessful = await AuthController().signIn( context: context,body: signInModelClass.toJson());
  //
  //
  //       setState(() {
  //         Provider.of<OurProviderClass>(context, listen: false).showBlurEffectFirst(false);
  //       });
  //
  //       if (!isSignInSuccessful) {
  //         setState(() {
  //           isLoading = false;
  //         });
  //       }
  //
  //     }
  //   } else {
  //
  //     String bioType = bioMetricType.contains(BiometricType.face) ? "FaceID" : "Fingerprint";
  //
  //     showBiometricPopup = true;
  //
  //     CustomToast.showTopToast(context: context, msg: 'Enter Login details to register $bioType', iconName: 'warning');
  //
  //   }
  //
  // }

  // signInButtonPress() async {
  //   FocusScope.of(context).requestFocus(FocusNode());
  //
  //
  //   if (formKey.currentState!.validate()) {
  //
  //     SignInModelClass signInModelClass = SignInModelClass(email: emailController.text, password: passwordController.text);
  //
  //
  //     // setState(() {
  //     //   isLoading = true;
  //     // });
  //
  //     setState(() {
  //       Provider.of<OurProviderClass>(context, listen: false).showBlurEffectFirst(true);
  //     });
  //
  //
  //     bool isSignInSuccessful = await AuthController().signIn(context: context,body: signInModelClass.toJson());
  //
  //     setState(() {
  //       Provider.of<OurProviderClass>(context, listen: false).showBlurEffectFirst(false);
  //     });
  //
  //     // if (!isSignInSuccessful){
  //     //   Provider.of<OurProviderClass>(context, listen: false).showBlurEffectFirst(false);
  //     // }
  //
  //
  //     // if (!isSignInSuccessful) {
  //     //   setState(() {
  //     //     isLoading = false;
  //     //   });
  //     // }
  //
  //     if (showBiometricPopup) {
  //       AppSharedPreferences.setBioPopupValue(true);
  //     }
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    var textTheme=Theme.of(context).textTheme;
    return Stack(
      children: [

        CustomScaffoldFirst(
          mainBody: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageIcon(AssetImage('assets/logo/logo.png'),size: 50,),

                Text('Login to your account',style: CustomTextStyles.title28BlackFullBold),

                Row(
                  children: [
                    Text("Don't have an account? ",style: CustomTextStyles.blackText16Bold600),
                    CustomInkWell(
                        onPress: (){

                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                        },

                        childWidget: Text('Sign Up',style: textTheme.bodySmall!.copyWith(color: CustomAppColors.primaryColor,fontWeight: FontWeight.w600),)),

                  ],
                ),

                SizedBox(height: 20,),

                TextFormFieldCustomerBuilt(
                  isEmail: true,
                  prefixIcon: 'email',
                  textInputType: TextInputType.emailAddress,
                  controller: emailController,
                  hintTxt: "Email/UserName",
                ),
                TextFormFieldCustomerBuilt(
                  obscText: true,
                  showEyeIcon: true,
                  prefixIcon: 'lock',
                  textInputType: TextInputType.text,
                  addBottomMargin: false,
                  controller: passwordController,
                  hintTxt: "Password",
                ),

                Align(
                    alignment: Alignment.topRight,
                    child: TextButton(

                        style: ButtonStyle(
                          visualDensity: VisualDensity(vertical: -4,horizontal: -4),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: (){

                          Navigator.push(context,ScreenNavigationSlide(page: ForgotPasswordScreen()));

                        },

                        child: Text("Forgot Password?",style: textTheme.bodySmall!.copyWith(color: CustomAppColors.blackColor),))),


                SizedBox(height: 20,),
                CustomButtonWidget(btntext: 'Login', isReverse:false,btnonPressed: ()async{


                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => ScaffoldSecondDashboard(),
                      settings: const RouteSettings(name: ConstStrings.scaffoldRouteName),
                    ),
                        (Route<dynamic> route) => false,
                  );




                  // await signInButtonPress();

                },),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                          color: CustomAppColors.blackColor.withValues(alpha: 0.28),
                          thickness: 2,
                        )),
                    Padding(
                      padding:
                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Center(child: Text('OR',style: Theme.of(context).textTheme.bodySmall!.copyWith(color: CustomAppColors.blackColor),)),
                    ),
                    Expanded(
                        child: Divider(
                          color: CustomAppColors.blackColor.withValues(alpha: 0.28),
                          thickness: 2,
                        )),

                  ],
                ),


                SizedBox(height: 20,),

                Platform.isAndroid ?

                CustomButtonWidget(

                  btntext: 'Continue with Google', isReverse:true,btnonPressed: (){},iconPath: 'assets/images/google.png',):

                CustomButtonWidget(

                  btntext: 'Continue with Apple', isReverse:true,btnonPressed: (){},iconPath: 'assets/images/mac.png',iconColor: CustomAppColors.whiteColor,),


                SizedBox(height: 20,),


                bioMetricType.isEmpty ?
                Container() :
                GestureDetector(
                  onTap: () async {
                    // await signInWithBiometric();
                  },
                  child: Center(
                    child: ImageIcon(
                      bioMetricType.contains(BiometricType.face)
                          ? const AssetImage("assets/icons/faceid.png")
                          : const AssetImage(
                          "assets/icons/fingerprint.png"),
                      size: 50,
                      color: CustomAppColors.blackColor,
                    ),
                  ),
                ),


                // CustomButtonWidget(
                //   isDarkGreyed: true,
                //   btntext: 'Continue with Apple', isReverse:false,btnonPressed: (){},iconPath: 'assets/images/mac.png',iconColor: CustomAppColors.whiteColor,),


              ],
            ),
          ),
        ),

        // if (isLoading) CustomBlurEffect(),

      ],
    );
  }
}
