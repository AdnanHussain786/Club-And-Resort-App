
import 'package:flutter/material.dart';
import '../Constants/const.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/custom_drawer.dart';
import '../Widgets/custom_textform_field.dart';
import '../Widgets/scaffold_first.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}



class _SignUpScreenState extends State<SignUpScreen> {

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var textTheme=Theme.of(context).textTheme;
    return CustomScaffoldFirst(
      mainBody: Form(

        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Register your account',style: CustomTextStyles.title28BlackFullBold),

            Row(
              children: [
                Text("Already have an account? ",style: CustomTextStyles.blackText16Bold600),
                SizedBox(width: 5,),
                CustomInkWell(
                    onPress: (){
                      Navigator.pop(context);
                    },
                    childWidget: Text('Login',style: textTheme.bodySmall!.copyWith(color: CustomAppColors.primaryColor,fontWeight: FontWeight.w600),)),
              ],
            ),

            SizedBox(height: 20,),

            TextFormFieldCustomerBuilt(
              prefixIcon: 'profile',
              textInputType: TextInputType.text,
              controller: usernameController,
              hintTxt: "Username",
              ontap: () {},
            ),

            TextFormFieldCustomerBuilt(
              prefixIcon: 'profile',
              textInputType: TextInputType.emailAddress,
              controller: emailController,
              hintTxt: "Email",
              ontap: () {},
            ),
            TextFormFieldCustomerBuilt(
              obscText: true,
              showEyeIcon: true,
              prefixIcon: 'lock',
              textInputType: TextInputType.text,
              addBottomMargin: true,
              controller: passwordController,
              hintTxt: "Password",
              ontap: () {},
            ),

            TextFormFieldCustomerBuilt(
              obscText: true,
              showEyeIcon: true,
              prefixIcon: 'lock',
              textInputType: TextInputType.text,
              addBottomMargin: true,
              controller: confirmPasswordController,
              hintTxt: "Confirm Password",
              ontap: () {},
            ),

            SizedBox(height: 20,),
            CustomButtonWidget(btntext: 'SignUp', isReverse:false,btnonPressed: (){

              // signupButtonPress();
              // Navigator.of(context).pushAndRemoveUntil(
              //   MaterialPageRoute(
              //     builder: (context) => ScaffoldSecondDashboard(),
              //     settings:
              //     const RouteSettings(name: ConstStrings.scaffoldRouteName),
              //   ),
              //       (Route<dynamic> route) => false,
              // );

            },),



          ],
        ),
      ),
    );
  }


  // signupButtonPress()async{
  //   FocusScope.of(context).requestFocus(FocusNode());
  //
  //   if (formKey.currentState!.validate()){
  //     if(passwordController.text.trim()!=confirmPasswordController.text.trim()){
  //       CustomToast.showTopToast(context: context, msg: 'Password and confirm password does not match',iconName: 'warning');
  //     }
  //     else{
  //       log(usernameController.text.toString());
  //       log(emailController.text.toString());
  //       log(passwordController.text.toString());
  //       log(confirmPasswordController.text.toString());
  //
  //       SignUpModelClass signUpModelClass = SignUpModelClass(
  //           username: usernameController.text,
  //           email: emailController.text,
  //           password: passwordController.text
  //       );
  //
  //       setState(() {
  //         Provider.of<OurProviderClass>(context, listen: false).showBlurEffectFirst(true);
  //       });
  //
  //       bool isSignedUp = await AuthController().signUp(context:context,body: signUpModelClass.toJson());
  //
  //       setState(() {
  //         Provider.of<OurProviderClass>(context, listen: false).showBlurEffectFirst(false);
  //       });
  //
  //
  //       if(isSignedUp){
  //
  //         CustomToast.showTopToast(context: context,
  //             bgColor: CustomAppColors.successColor,
  //             msg: "Please Enter the OTP code sent on \n${signUpModelClass.email}", iconName: "email");
  //
  //         // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> OTPVerifyScreen(userEmail: emailController.text,)));
  //       }
  //     }
  //
  //
  //
  //   }
  // }

}
