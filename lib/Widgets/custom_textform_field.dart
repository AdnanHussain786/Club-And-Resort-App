import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Constants/const.dart';
import '../Utils/shared_preferences.dart';

class TextFormFieldCustomerBuilt extends StatefulWidget {
  TextFormFieldCustomerBuilt(
      {super.key,
        this.controller,
        this.hintTxt,
        this.icoon,
        this.obscText,
        this.ontap,
        this.suffitext,
        this.textInputType,
        this.isOptional,
        this.isNumber,
        this.maxLines,
        this.showSeparator,
        this.eyeIcon,
        this.showEyeIcon,
        this.isEmail,
        this.isonAssetPath,
        this.isReadOnly,
        this.autoFocus = false,
        this.topLable,
        this.onChangeTextField,
        this.isSearchSchoolField = false,
        this.backgroundColor,
        this.isMarksFeedingField = false,
        this.onFieldSubmit,
        this.iconSize = 15,
        this.focusNode,
        this.addBottomMargin = true,
        this.showMultiLinesBigField = false,
        this.prefixIcon,
        this.borderRadius = 12.0,
        this.isSearchField = false,
        this.borderColor,
        this.textAlign = TextAlign.start,
        this.textStyle,
        this.isPasswordField = false,
        this.isOTP = false,
        this.filled = false,
        this.hintColor,
        this.isPaymentField = false,
        this.isIcoonCoveredWithContainer = false,
        this.maxLength,
        this.inputFormatters,
        this.textColor,
        this.showCursor = false});

  TextEditingController? controller;
  String? hintTxt, suffitext, isonAssetPath;
  String? topLable;
  Widget? icoon;
  VoidCallback? ontap;
  TextInputType? textInputType = TextInputType.text;
  bool? isOptional = false,
      isNumber = false,
      isEmail = false,
      isSearchSchoolField = false,
      obscText = false,
      isReadOnly,
      autoFocus = false,
      filled = false,
      isPaymentField = false,
      isIcoonCoveredWithContainer = false,
      showCursor = false;
  int? maxLines;
  bool? showSeparator = true, showEyeIcon = false, isMarksFeedingField;
  Widget? eyeIcon;
  Function(String)? onChangeTextField;
  Color? backgroundColor;
  Color? borderColor;
  Function(String)? onFieldSubmit;
  double iconSize;
  FocusNode? focusNode;
  bool? addBottomMargin;
  bool? showMultiLinesBigField;
  String? prefixIcon;
  double borderRadius;
  bool? isSearchField;
  TextAlign textAlign;
  TextStyle? textStyle;
  Color? hintColor;
  bool? isPasswordField, isOTP;
  int? maxLength;
  List<TextInputFormatter>? inputFormatters;
  Color? textColor;

  @override
  State<TextFormFieldCustomerBuilt> createState() =>
      _TextFormFieldCustomerBuiltState();
}

class _TextFormFieldCustomerBuiltState
    extends State<TextFormFieldCustomerBuilt> {
  bool hidePass = true;

  void togglePassField() {
    setState(() {
      hidePass = !hidePass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.topLable != null
            ? Container(
          padding: EdgeInsets.only(left: 5, bottom: 5),
          child: Text(widget.topLable!,
              style: Theme.of(context).textTheme.bodyMedium),
        )
            : Container(),
        Stack(
          children: [
            Container(
              height: widget.showMultiLinesBigField!
                  ? null
                  : widget.isSearchField!
                  ? ConstValues.heightOfSearchField
                  : ConstValues.heightOfTextField,
              margin: widget.addBottomMargin!
                  ? ConstValues.textFieldsMargins
                  : const EdgeInsets.fromLTRB(3, 0, 3, 3),
              // width: widget.isOTP! ? 40 : double.infinity,
              width:  double.infinity,
              // decoration: CustomBoxDecoration.textFormFieldDecoration(),
              child: TextFormField(
                maxLength:widget.maxLength,
                buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
                textAlign: widget.isOTP! ? TextAlign.center : widget.textAlign,
                // textAlign: widget.textAlign,

                showCursor: widget.showCursor!
                    ? widget.showCursor
                    : MediaQuery.of(context).viewInsets.bottom != 0
                    ? true
                    : false,

                cursorColor:widget.textColor ?? CustomAppColors.blackColor,
                onFieldSubmitted: widget.onFieldSubmit,
                autofocus: widget.autoFocus ?? false,
                onChanged: widget.onChangeTextField,
                focusNode: widget.focusNode,
                readOnly: widget.isReadOnly ?? false,
                style: widget.textStyle ??

                    Theme.of(context).textTheme.bodySmall!.copyWith(color: widget.textColor),

                // TextStyle(
                //     fontSize: 14, color:widget.textColor ?? CustomAppColors.whiteColor),
                maxLines: widget.showMultiLinesBigField! ? 5 : 1,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                scrollPadding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                inputFormatters:

                widget.inputFormatters!=null ? widget.inputFormatters :

                widget.isNumber != true
                    ? []
                    : [
                  if (widget.isOTP!) LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly
                ],
                keyboardType: widget.textInputType,
                obscureText: widget.obscText ?? false ? hidePass : false,
                validator: widget.isOptional != true
                    ? widget.isPasswordField == true
                    ? (value) {
                  if (value == null || value.isEmpty) {
                    // CustomToast.showToast(message: "${widget.topLable} should not be null");
                    return "${widget.topLable} should not be null";
                  }
                  RegExp passwordPattern = RegExp(
                      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
                  if (!passwordPattern.hasMatch(value)) {
                    // CustomToast.showToast(
                    //     message: 'Password must be at least 8 characters including uppercase, lowercase, a number, and a special character.');
                    return 'Password must be at least 8 characters long and include uppercase, lowercase, a number, and a special character.';
                  }
                  return null;
                }
                    : widget.isEmail == true
                    ? (value) {
                  RegExp regex = RegExp(
                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                      r"{0,253}[a-zA-Z0-9])?)*$");
                  if (value == null ||
                      value.isEmpty ||
                      !regex.hasMatch(value)) {
                    // CustomToast.showToast(message:  'Enter a valid email address');
                    return 'Enter a valid email address';
                  }
                  return null;
                }
                    : (value) {
                  if (value == null || value.isEmpty) {
                    // CustomToast.showToast(message: "${widget.topLable} should not be null");
                    return "${widget.topLable} should not be null";
                  }
                  return null;
                }
                    : (value) {
                  return null;
                },

                onTap: widget.ontap,
                controller: widget.controller,
                decoration: InputDecoration(
                  contentPadding: widget.isOTP!
                      ? const EdgeInsets.fromLTRB(10, 0, 10, 0)
                      : EdgeInsets.symmetric(
                      vertical: widget.showMultiLinesBigField! ? 20 : 0,
                      horizontal: widget.isMarksFeedingField! ? 10 : 30),

                  hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: widget.hintColor ?? CustomAppColors.blackColor),

                  labelStyle:
                  const TextStyle(fontSize: 13, color: Colors.redAccent),
                  fillColor: widget.backgroundColor ?? Colors.transparent,
                  filled: widget.filled,
                  hintText: widget.hintTxt,
                  prefixIconColor: CustomAppColors.blackColor,
                  prefixIcon: widget.prefixIcon != null
                      ? UnconstrainedBox(
                      child: SizedBox(
                          height: widget.iconSize,
                          width: widget.iconSize,
                          child: ImageIcon(AssetImage(
                              'assets/icons/${widget.prefixIcon}.png'))))
                      : null,
                  suffixIcon: widget.isIcoonCoveredWithContainer! &&
                      widget.icoon != null
                      ?  UnconstrainedBox(
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomAppColors.primaryColor,
                      ),
                      // padding: const EdgeInsets.all(10),
                      // icon padding inside container
                      child: Center(child: widget.icoon),
                    ),
                  )
                      : widget.icoon != null
                      ? UnconstrainedBox(
                      child: SizedBox(
                          height: widget.iconSize,
                          width: widget.iconSize,
                          child: widget.icoon))
                      : (widget.showEyeIcon == true
                      ? InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        togglePassField();
                      },
                      child: Icon(
                        hidePass
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: CustomAppColors.blackColor,
                      ))
                      : widget.isPaymentField!
                      ? UnconstrainedBox(
                    child: Padding(
                      padding:
                      const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                              'assets/images/mastercard.png',
                              height: 24,
                              width: 24),
                          SizedBox(width: 6),
                          Image.asset(
                              'assets/images/visa.png',
                              height: 24,
                              width: 24),
                          SizedBox(width: 6),
                          Image.asset(
                              'assets/images/american_express.png',
                              height: 24,
                              width: 24),
                          SizedBox(width: 6),
                          Image.asset('assets/images/jcb.png',
                              height: 24, width: 24),
                        ],
                      ),
                    ),
                  )
                      : null),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(widget.borderRadius)),
                    borderSide: BorderSide(
                      color: widget.borderColor != null
                          ? widget.borderColor!
                          :
                      AppSharedPreferences.getIsDarkMode() == true ?
                      CustomAppColors.greyColor.withValues(alpha: 0.12).withValues(alpha: 0.5):CustomAppColors.blackColor.withValues(alpha: 0.5),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(widget.borderRadius)),
                    borderSide: BorderSide(
                      color: widget.borderColor != null
                          ? widget.borderColor!
                          : CustomAppColors.blackColorForFieldsBorders.withValues(alpha: 0.5),
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(widget.borderRadius)),
                    borderSide: BorderSide(
                      color: CustomAppColors.redColor,
                      width: 1,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(widget.borderRadius)),
                    borderSide: BorderSide(
                      color: CustomAppColors.redColor,
                      width: 1.0,
                    ),
                  ),
                  errorStyle: const TextStyle(fontSize: 0.1),

                  // errorStyle: CustomTextStyles.blackText10Normal400
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
