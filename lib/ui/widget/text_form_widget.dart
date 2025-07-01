import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_assets/app_color.dart';
import 'text_widget.dart';

// ignore: must_be_immutable
class TextFormWidget extends StatelessWidget {
  final TextCapitalization? textCapitalization;
  final String? label;
  final String? floatingLabel;
  final String? hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onPasswordToggle;
  final Function(String)? onChange;
  final Function(String)? onEditCompleted;
  final String? initialValue;
  final String? text;
  final FocusNode? focusNode;
  List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final AutovalidateMode? autoValidateMode;
  final bool? obscureText;
  final bool? alignLabelWithHint;
  final bool? readOnly;
  final bool? isGender;
  final bool? isFeedback;
  final bool? isFilled;
  final bool autofocus;
  final bool? isAsterix;
  final Function()? onTapped;
  TextStyle? labelStyle;
  final TextInputType? keyboardType;
  final Color? suffixIconColor;
  final Color? borderColor;
  final Color labelColor;
  final Color? fillColor;
  final Color? prefixIconColor;
  final Key? formKey;
  final double? size;
  final int? maxline;
  final int? minline;
  final double? border;
  final ScrollController? scrollController;

  TextFormWidget({
    super.key,
    this.textCapitalization,
    this.label,
    this.floatingLabel,
    this.hint,
    this.isFilled = false,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixWidget,
    this.prefixWidget,
    this.validator,
    this.onPasswordToggle,
    this.initialValue,
    this.inputFormatters,
    this.controller,
    this.alignLabelWithHint = false,
    this.isAsterix = false,
    this.autoValidateMode,
    this.obscureText = false,
    this.isGender = false,
    this.autofocus = false,
    this.readOnly = false,
    this.isFeedback = false,
    this.onTapped,
    this.labelStyle,
    this.onEditCompleted,
    this.keyboardType,
    this.suffixIconColor,
    this.fillColor,
    this.prefixIconColor,
    this.onChange,
    this.formKey,
    this.size,
    this.text,
    this.borderColor = AppColor.grey,
    this.labelColor = AppColor.lightgrey,
    this.maxline = 1,
    this.border = 4,
    this.minline,
    this.focusNode,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        hint != null
            ? Padding(
              padding: EdgeInsets.only(bottom: 6.w),
              child: TextView(
                text: hint!,
                fontSize: 16.2.sp,
                textStyle: GoogleFonts.gabarito(
                  color: AppColor.black,
                  fontSize: 16.0.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
            : const SizedBox.shrink(),
        TextFormField(
          keyboardType: keyboardType,
          focusNode: focusNode,
          autofocus: autofocus,
          style: TextStyle(fontSize: 16.sp),
          scrollController: scrollController,
          scrollPhysics: BouncingScrollPhysics(),
          decoration: InputDecoration(
            alignLabelWithHint: alignLabelWithHint,
            filled: isFilled,
            fillColor: fillColor,
            contentPadding: EdgeInsets.fromLTRB(20.w, 10.w, 20.w, 19.w),
            labelText: label ?? '',
            labelStyle:
                labelStyle ??
                GoogleFonts.dmSans(
                  color: labelColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: BorderSide(width: 1.w, color: borderColor!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(border!.r)),
              borderSide: BorderSide(width: 1.w, color: borderColor!),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
              borderSide: BorderSide(width: 1.w, color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(border!.r)),
              borderSide: BorderSide(width: 1.w, color: borderColor!),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide: BorderSide(width: 1.w, color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide: BorderSide(width: 1.w, color: Colors.redAccent),
            ),
            prefixIcon:
                prefixWidget ??
                (prefixIcon != null
                    ? IconButton(
                      onPressed: onPasswordToggle,
                      icon: Icon(prefixIcon, color: prefixIconColor),
                    )
                    : null),

            suffixIcon: Padding(
              padding: EdgeInsets.all(1.5.w),
              child:
                  suffixWidget ??
                  (suffixIcon != null
                      ? IconButton(
                        onPressed: onPasswordToggle,
                        iconSize: size,
                        icon: Icon(
                          suffixIcon,
                          color: suffixIconColor,
                          size: 20.sp,
                        ),
                      )
                      : null),
            ),
          ),
          obscureText: obscureText!,
          controller: controller,
          readOnly: readOnly!,
          onTap: onTapped,
          key: formKey,
          maxLines: maxline,
          minLines: minline,
          cursorColor: AppColor.primary,
          onChanged: onChange,
          onFieldSubmitted: onEditCompleted,
          validator: validator,
        ),
      ],
    );
  }
}
