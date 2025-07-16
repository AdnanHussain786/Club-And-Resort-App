
import 'package:club_and_resort/Constants/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Utils/providers.dart';
import 'custom_blur_effect.dart';


class CustomScaffoldFirst extends StatelessWidget {
  CustomScaffoldFirst({
    super.key,
    required this.mainBody,
    this.showBottomIns = true,
    this.mainBodyAlignment = Alignment.center
  });

  final Widget? mainBody;
  bool showBottomIns = true;
  Alignment mainBodyAlignment;

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [

        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [CustomAppColors.creamBackgroundScaffold, CustomAppColors.whiteSecond],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
                backgroundColor: Colors.transparent,
              leading: ModalRoute.of(context)?.canPop == true
                  ? Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: CustomAppColors.whiteSecond,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    splashRadius: 20,
                    icon:  ImageIcon(
                      AssetImage("assets/icons/back_arrow.png"),
                      color: CustomAppColors.blackColor,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              )
                  : null,


            ),
            resizeToAvoidBottomInset: false,
            // appBar: AppBar(backgroundColor: Colors.transparent,),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Expanded(
                      // flex: 2,
                      child: Container(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Align(
                          alignment: mainBodyAlignment,
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Padding(
                              padding: EdgeInsets.only(
                                bottom: MediaQuery.of(context).viewInsets.bottom,
                              ),
                              child: mainBody,
                            ),
                          ),
                        ),
                      ),
                    ),

                    showBottomIns?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: 'By continuing, you agree to our\n',
                                    style: CustomTextStyles.blackText14Normal),
                                TextSpan(
                                    text: 'User Agreement',
                                    style:CustomTextStyles.blackText14Bold),
                                TextSpan(
                                    text: ' and ',
                                    style:CustomTextStyles.blackText14Normal),
                                TextSpan(
                                    text: 'Privacy Policy',
                                    style: CustomTextStyles.blackText14Bold),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ):Container(),

                  ],
                ),
              ),
            ),
          ),
        ),

        if(Provider.of<OurProviderClass>(context, listen: false).getBlurEffectFirst==true)CustomBlurEffect(),

      ],
    );
  }
}
