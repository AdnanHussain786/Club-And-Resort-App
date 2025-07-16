import 'package:flutter/material.dart';

import '../Constants/const.dart';

class DrawerListElement extends StatelessWidget {
  //ignore: must_be_immutable

  DrawerListElement(
      {super.key,
        required this.onPress,
        required this.title,
        required this.iconPath,
        // this.showDivider = true,
        this.iconColor});

  final Function onPress;
  final String iconPath, title;
  // bool showDivider;
  Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          CustomInkWell(
            onPress: () {
              onPress();
            },
            childWidget: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ImageIcon(
                  AssetImage(iconPath),
                  size: 18,

                  color: iconColor ?? CustomAppColors.blackColor,
                ),
                Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    title, style: CustomTextStyles.blackText14Bold,
                  ),
                ),
              ],
            ),
          ),
          // showDivider
          //     ? const Divider(
          //   thickness: 0.5,
          //   // thickness: 1,
          // )
          //     : Container(),
        ],
      ),
    );
  }
}
class CustomInkWell extends StatelessWidget {
  //ignore: must_be_immutable

  CustomInkWell({super.key, required this.childWidget, required this.onPress});

  Widget childWidget;
  VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      splashColor: CustomAppColors.primaryColor.withValues(alpha: 0.7),
      highlightColor: CustomAppColors.primaryColor.withValues(alpha: 0.7),

      onTap: () {
        onPress();
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: childWidget,
      ),
    );
  }
}