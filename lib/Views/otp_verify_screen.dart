
import 'dart:async';


import 'package:club_and_resort/Views/sign_in_screen.dart';
import 'package:flutter/material.dart';
import '../Constants/const.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/custom_textform_field.dart';
import '../Widgets/scaffold_first.dart';

class OTPVerifyScreen extends StatefulWidget {
  const OTPVerifyScreen(
      {super.key,
        required this.userEmail,
        this.isOTPRequiredInInitState = false,
        this.isForgotPasswordOTP = false});

  final String userEmail;
  final bool? isOTPRequiredInInitState;
  final bool? isForgotPasswordOTP;

  @override
  State<OTPVerifyScreen> createState() => _OTPVerifyScreenState();
}

class _OTPVerifyScreenState extends State<OTPVerifyScreen> {
  List<TextEditingController> otpController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  TextFormFieldCustomerBuilt otpField(TextEditingController controller) {
    return TextFormFieldCustomerBuilt(
      isOptional: true,
      onChangeTextField: (s) {
        if (s.length == 1) {
          FocusScope.of(context).nextFocus();
        }
      },
      isOTP: true,
      isNumber: true,
      textInputType: TextInputType.number,
      controller: controller,
    );
  }

  int secondsRemaining=60;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    startTimer();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isOTPRequiredInInitState ?? false) {
        // sendOTPInInitStateForSignIn();
      }
    });
  }

  // sendOTPInInitStateForSignIn() async {
  //   setState(() {
  //     Provider.of<OurProviderClass>(context, listen: false)
  //         .showBlurEffectFirst(true);
  //   });
  //
  //   await AuthController().resendOTP(
  //     context: context,
  //     email: widget.userEmail,
  //   );
  //   setState(() {
  //     Provider.of<OurProviderClass>(context, listen: false)
  //         .showBlurEffectFirst(false);
  //   });
  // }

  // sendOTPInInitStateForForgotPassword() async {
  //   setState(() {
  //     Provider.of<OurProviderClass>(context, listen: false)
  //         .showBlurEffectFirst(true);
  //   });
  //
  //   await AuthController().sendOTPForgotPassword(
  //     context: context,
  //     email: widget.userEmail,
  //   );
  //   setState(() {
  //     Provider.of<OurProviderClass>(context, listen: false)
  //         .showBlurEffectFirst(false);
  //   });
  // }

  startTimer() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (mounted) {
        setState(() {
          if (secondsRemaining > 0) {
            secondsRemaining--;
          } else {
            timer.cancel();
          }
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return CustomScaffoldFirst(
      mainBody: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Verify OTP', style: textTheme.bodyLarge),
            SizedBox(
              height: 20,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: otpField(otpController[0])),
                SizedBox(
                  width: 5,
                ),
                Expanded(child: otpField(otpController[1])),
                SizedBox(
                  width: 5,
                ),
                Expanded(child: otpField(otpController[2])),
                SizedBox(
                  width: 5,
                ),
                Expanded(child: otpField(otpController[3])),
                SizedBox(
                  width: 5,
                ),
                Expanded(child: otpField(otpController[4])),
                SizedBox(
                  width: 5,
                ),
                Expanded(child: otpField(otpController[5])),
              ],
            ),
            widget.isForgotPasswordOTP!
                ? Column(
              children: [
                TextFormFieldCustomerBuilt(
                  obscText: true,
                  showEyeIcon: true,
                  prefixIcon: 'lock',
                  textInputType: TextInputType.text,
                  addBottomMargin: false,
                  controller: passwordController,
                  hintTxt: "Password",
                ),
                TextFormFieldCustomerBuilt(
                  obscText: true,
                  showEyeIcon: true,
                  prefixIcon: 'lock',
                  textInputType: TextInputType.text,
                  addBottomMargin: false,
                  controller: confirmPasswordController,
                  hintTxt: "Confirm Password",
                ),
              ],
            )
                : Container(),

            Align(
              alignment: Alignment.centerRight,
              child: secondsRemaining < 1
                  ? CustomButtonWidget(
                width: MediaQuery.of(context).size.width / 2,
                shrinkHeight: true,
                btntext: 'Resend OTP',
                isReverse: false,
                btnonPressed: () async {
                  // if (widget.isOTPRequiredInInitState ?? false) {
                  //   // await sendOTPInInitStateForSignIn();
                  // }
                  // if (widget.isForgotPasswordOTP ?? false) {
                  //   // await sendOTPInInitStateForForgotPassword();
                  // }
                  // startTimer();
                },
              )
                  : Text(
                'Resend in $secondsRemaining s',
                style: textTheme.bodySmall,
              ),
            ),

            SizedBox(
              height: 20,
            ),
            CustomButtonWidget(
              btntext: 'Verify OTP',
              isReverse: false,
              btnonPressed: () async {

                CustomToast.showTopToast(
                              context: context,
                              msg: 'Password changed Successfully Please Login with new password',
                              iconName: 'warning',
                              bgColor: CustomAppColors.successColor);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => SignInScreen()),
                                (Route<dynamic> route) => false,
                          );

                // if (formKey.currentState!.validate()) {
                //   String otp =
                //   List.generate(6, (index) => otpController[index].text).join();
                //
                //   if (widget.isForgotPasswordOTP! &&
                //       passwordController.text ==
                //           confirmPasswordController.text) {
                //     setState(() {
                //       Provider.of<OurProviderClass>(context, listen: false)
                //           .showBlurEffectFirst(true);
                //     });
                //     bool isSuccess = await AuthController().resetPassword(
                //       context: context,
                //       newPassword: confirmPasswordController.text,
                //       otp: otp,
                //       email: widget.userEmail,
                //     );
                //     setState(() {
                //       Provider.of<OurProviderClass>(context, listen: false)
                //           .showBlurEffectFirst(false);
                //     });
                //     if (isSuccess) {
                //       CustomToast.showTopToast(
                //           context: context,
                //           msg: 'Password changed Successfully Please Login with new password',
                //           iconName: 'warning',
                //           bgColor: CustomAppColors.successColor);
                //       Navigator.pushAndRemoveUntil(
                //         context,
                //         MaterialPageRoute(builder: (context) => SignInScreen()),
                //             (Route<dynamic> route) => false,
                //       );
                //
                //     }
                //   } else if(widget.isForgotPasswordOTP! &&
                //       passwordController.text !=
                //           confirmPasswordController.text) {
                //     CustomToast.showTopToast(context: context, msg: 'Password and confirm password does not match', iconName:'warning');
                //   }
                //
                //   if (widget.isOTPRequiredInInitState!) {
                //     setState(() {
                //       Provider.of<OurProviderClass>(context, listen: false).showBlurEffectFirst(true);
                //     });
                //     bool isSuccess = await AuthController().verifyEmail(
                //       context: context,
                //       otp: otp,
                //       email: widget.userEmail,
                //     );
                //     setState(() {
                //       Provider.of<OurProviderClass>(context, listen: false).showBlurEffectFirst(false);
                //     });
                //     if (isSuccess) {
                //       CustomToast.showTopToast(
                //           context: context,
                //           msg: 'Email verified Successfully',
                //           iconName: 'warning',
                //           bgColor: CustomAppColors.successColor);
                //       Navigator.pushAndRemoveUntil(
                //         context,
                //         MaterialPageRoute(builder: (context) => SignInScreen()),
                //             (Route<dynamic> route) => false,
                //       );
                //     }
                //   }
                // }
              },
            ),
          ],
        ),
      ),
    );
  }
}
