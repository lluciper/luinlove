import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/utils.dart';

class TextFieldSendRecord extends StatefulWidget {
  const TextFieldSendRecord({
    Key? key,
    this.controller,
    required this.labelText,
    required this.hintText,
    required this.errorText,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    required this.onChanged,
    this.enable = true,
    this.minLines = 1,
    this.maxLines = 1,
    this.isRequired = false,
    this.readOnly = false,
    this.onTap,
    this.numberOnly = false,
    this.textStyle,
    this.inputFormatters,
    this.fillColor,
    this.isSearch = false,
    this.textInputAction,
    this.onFieldSubmitted,
    this.autoFocus = false,
    this.textCapitalization = TextCapitalization.none,
    this.focusNode,
    this.initialValue,
    this.onEditingComplete,
  }) : super(key: key);
  final TextEditingController? controller;
  final bool enable;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function(String?)? onChanged;
  final int minLines;
  final int maxLines;
  final bool isRequired;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;
  final bool numberOnly;
  final TextStyle? textStyle;
  final Color? fillColor;
  final bool isSearch;
  final TextInputAction? textInputAction;
  final void Function(String?)? onFieldSubmitted;
  final void Function(String?)? onEditingComplete;
  final bool autoFocus;
  final TextCapitalization textCapitalization;
  final FocusNode? focusNode;
  final String? initialValue;

  @override
  State<TextFieldSendRecord> createState() => _TextFieldSendRecordState();
}

class _TextFieldSendRecordState extends State<TextFieldSendRecord> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          key: widget.key,
          initialValue: widget.initialValue,
          focusNode: widget.focusNode,
          textCapitalization: widget.textCapitalization,
          autofocus: widget.autoFocus,
          onFieldSubmitted: widget.onFieldSubmitted,
          textInputAction: widget.textInputAction,
          // inputFormatters: [
          //   FilteringTextInputFormatter.deny(RegExp(
          //       r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'))
          // ],
          onTap: widget.onTap,
          readOnly: widget.readOnly,
          style: GoogleFonts.aBeeZee(
            color: AppColors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          onChanged: widget.onChanged,
          controller: widget.controller,
          enabled: widget.enable,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            fillColor: widget.fillColor ?? AppColors.white,
            filled: true,
            label: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.labelText ?? '',
                  style: GoogleFonts.aBeeZee(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  // style: AppTextStyles.small.fw400().copyWith(
                  //     color:
                  //         (widget.errorText == null || widget.errorText == '')
                  //             ? AppColors.N7
                  //             : AppColors.R5),
                ),
                widget.isRequired
                    ? Text(
                        ' *',
                        style: GoogleFonts.aBeeZee(
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        // style: AppTextStyles.small.fw400().fcR5(),
                      )
                    : const SizedBox(),
              ],
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: widget.hintText,
            hintStyle: GoogleFonts.aBeeZee(
              color: AppColors.gray500,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            errorText: (widget.errorText == null || widget.errorText == '')
                ? null
                : (' ${widget.errorText!}'),
            errorStyle: GoogleFonts.aBeeZee(
              color: AppColors.gray500,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            contentPadding: EdgeInsets.only(
                top: 0, bottom: 0, left: 12, right: widget.isSearch ? 40 : 12),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: AppColors.gray500,
                width: 1,
                style: BorderStyle.none,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: AppColors.gray500,
                width: 1,
                style: widget.isSearch ? BorderStyle.none : BorderStyle.solid,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: AppColors.gray500,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: AppColors.green,
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: AppColors.red,
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
