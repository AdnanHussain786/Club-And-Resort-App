
import 'package:flutter/material.dart';

import '../Constants/const.dart';


class CustomTextButton extends StatelessWidget {
  CustomTextButton({
    super.key,
    required this.btnTitle,
    required this.btnPress

  });

  String btnTitle;
  Function btnPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(
          CustomAppColors.primaryColor,
        ),
        overlayColor: WidgetStateProperty.all<Color>(
            CustomAppColors.secondaryColor
        ),
        side: WidgetStateProperty.all<BorderSide>(
          BorderSide(
            color: CustomAppColors.primaryColor,
            width: 1,
          ),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // optional rounded corners
          ),
        ),
      ),
      onPressed: () {
        btnPress();
      },
      child: Text(btnTitle,style: CustomTextStyles.title12DarkLightBold,),
    );
  }
}
