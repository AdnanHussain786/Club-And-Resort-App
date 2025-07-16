


import 'package:flutter/material.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/custom_textform_field.dart';
import '../Widgets/scaffold_first.dart';
import '../Widgets/screen_navigation_slide.dart';
import 'otp_verify_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});



  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return CustomScaffoldFirst(
      mainBody: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Forgot Password', style: textTheme.bodyLarge),
            SizedBox(
              height: 20,
            ),
            TextFormFieldCustomerBuilt(
              prefixIcon: 'email',
              isEmail: true,
              textInputType: TextInputType.emailAddress,
              controller: emailController,
              hintTxt: "Enter your Email",
              addBottomMargin: true,
              ontap: () {},
            ),
            CustomButtonWidget(
              btntext: 'Get OTP',
              isReverse: false,
              btnonPressed: () async{

                Navigator.push(
                          context, ScreenNavigationSlide(page: OTPVerifyScreen(userEmail: emailController.text,isForgotPasswordOTP: true,)));

                // if(formKey.currentState!.validate()){
                  // bool response=await sendOTPInInitStateForForgotPassword();
                  // if(response==true){
                  //   Navigator.push(
                  //       context, ScreenNavigationSlide(page: OTPVerifyScreen(userEmail: emailController.text,isForgotPasswordOTP: true,)));
                  //   CustomToast.showTopToast(context: context,
                  //       bgColor: CustomAppColors.successColor,
                  //       msg: "Please Enter the OTP code sent on \n${emailController.text}", iconName: "email");
                  //
                  // }
                  // else{
                  //   CustomToast.showTopToast(context: context, msg:'Email is invalid / does not exist', iconName:'warning');
                  // }

                // }

              },
            ),
          ],
        ),
      ),
    );
  }


  // Future<bool> sendOTPInInitStateForForgotPassword() async {
  //   setState(() {
  //     Provider.of<OurProviderClass>(context, listen: false).showBlurEffectFirst(true);
  //   });
  //
  //
  //   bool result = await AuthController().sendOTPForgotPassword(
  //     context: context,
  //     email: emailController.text,
  //   );
  //
  //   setState(() {
  //     Provider.of<OurProviderClass>(context, listen: false).showBlurEffectFirst(false);
  //   });
  //
  //   return result;
  // }
}
