import 'package:flutter/material.dart';

import '../Constants/const.dart';

class CustomButtonWidget extends StatefulWidget {
  CustomButtonWidget({
    super.key,
    required this.btntext,
    this.btnonPressed,
    required this.isReverse,
    this.centerWidget,
    this.width,
    this.isDarkGreyed=false,
    this.iconPath,
    this.iconColor,
    this.shrinkHeight=false
  });

  final String btntext;
  final VoidCallback? btnonPressed;
  final bool isReverse;
  final Widget? centerWidget;
  final double? width;
  final bool? isDarkGreyed;
  final String? iconPath;
  final Color? iconColor;
  final bool? shrinkHeight;

  @override
  State<CustomButtonWidget> createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget> {
  @override
  Widget build(BuildContext context) {

    return Container(
      constraints: BoxConstraints(

        minWidth: widget.width ?? double.infinity,
      ),
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
          minimumSize:
          widget.width != null
              ? Size(widget.width!, 53)
              : const Size.fromHeight(56),

          padding:widget.shrinkHeight! ? EdgeInsets.symmetric(vertical: 4):null,

          backgroundColor:widget.isDarkGreyed!=null && widget.isDarkGreyed! ? CustomAppColors.greyColor.withValues(alpha: 0.12) :  widget.isReverse
              ? CustomAppColors.greyColor.withValues(alpha: 0.12)
              : CustomAppColors.primaryColor,

          foregroundColor: widget.isReverse || widget.isDarkGreyed! ? CustomAppColors.primaryColor : Colors.black,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
            side: widget.isDarkGreyed == true
                ? BorderSide(width: 2, color: CustomAppColors.greyColor.withValues(alpha: 0.12))
                : widget.isReverse == true
                ? BorderSide(width: 2, color: CustomAppColors.greyColor.withValues(alpha: 0.12))
                : BorderSide(width: 0, color: CustomAppColors.primaryColor),
          ),
        ),
        onPressed: widget.btnonPressed,
        child: widget.centerWidget ??
            (widget.iconPath != null
                ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(widget.iconPath!, width: 24, height: 24,color:widget.iconColor,),
                const SizedBox(width: 20),
                Text(
                  widget.btntext,
                  style: widget.isReverse
                      ? Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: CustomAppColors.blackColor,
                  )
                      : Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: CustomAppColors.blackColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            )
                : Text(
              widget.btntext,
              style: widget.isReverse
                  ? Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w700,
                color: CustomAppColors.blackColor,
              )
                  : Theme.of(context).textTheme.bodySmall!.copyWith(
                color: CustomAppColors.whiteColor,
                fontWeight: FontWeight.w700,
              ),
            )),


      ),
    );
  }
}