import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/utils.dart';


class TextFieldCommon extends StatefulWidget {
  const TextFieldCommon({
    Key? key,
    this.label,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.labelStyle,
    this.fillColor = AppColors.transparent,
    this.clearTextColor = AppColors.transparent,
    this.obscureText = false,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.onTap,
    this.hintStyle,
    this.cursorColor,
    this.style,
    this.borderColor = Colors.transparent,
    this.onSubmitted,
    this.focusColor = AppColors.transparent,
    this.maxLines = 1,
    this.height,
    this.keyboardType,
    this.isRequired = false,
    this.autofocus = false,
    this.floatingLabelBehavior,
    this.contentPadding,
    this.inputFormatters,
    this.readOnly = false,
    this.onEditingComplete,
    this.textInputAction,
    this.labelNoFocus = '',
    this.isCollapsed = false,
    this.hasClearText = false,
    this.onClearText,
    this.cursorHeight,
  }) : super(key: key);

  final String? label;
  final String labelNoFocus;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? fillColor;
  final Color? cursorColor;
  final double? cursorHeight;
  final Color borderColor;
  final Color focusColor;
  final Color clearTextColor;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final void Function()? onClearText;
  final int maxLines;
  final double? height;
  final TextInputType? keyboardType;
  final bool isRequired;
  final bool readOnly;
  final bool obscureText;
  final bool autofocus;
  final bool isCollapsed;
  final bool hasClearText;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? contentPadding;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<TextFieldCommon> createState() => _TextFieldCommonState();
}

class _TextFieldCommonState extends State<TextFieldCommon> {
  FocusNode? _focusNode;
  TextEditingController? _textCTL;
  bool isShowClose = false;
  bool hasListenController = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _textCTL = TextEditingController();
    // initListenController();
    // (widget.focusNode ?? _focusNode)?.addListener(_handleFocusChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: widget.maxLines > 1 ? null : widget.height,
              constraints: BoxConstraints(
                minHeight: widget.height ?? 56,
              ),
              decoration: BoxDecoration(
                color: widget.fillColor,
                borderRadius: BorderRadius.circular(8),
                // border: ,
              ),
              child: TextField(
                focusNode: widget.focusNode ?? _focusNode,
                controller: widget.controller ?? _textCTL,
                obscureText: widget.obscureText,
                obscuringCharacter: '●',
                readOnly: widget.readOnly,
                minLines: 1,
                maxLines: widget.obscureText ? 1 : widget.maxLines,
                cursorRadius: const Radius.circular(100),
                onTap: widget.onTap,
                onSubmitted: widget.onSubmitted,
                onEditingComplete: widget.onEditingComplete,
                keyboardType: widget.keyboardType,
                inputFormatters: widget.inputFormatters,
                textInputAction: widget.textInputAction,
                decoration: InputDecoration(
                  label: RichText(
                    text: TextSpan(
                      // text: _getLabel(),
                      style: widget.labelStyle 
                          ,
                      children: [
                        if (widget.isRequired)
                          TextSpan(
                            text: ' *',
                            // style: style,
                          ),
                      ],
                    ),
                  ),
                  isCollapsed: widget.isCollapsed,
                  prefixIcon: widget.prefixIcon != null
                      ? Container(
                          padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                          height: 24,
                          width: 24,
                          child: widget.prefixIcon,
                        )
                      : null,
                  // suffixIcon: _buildSuffixIcon(),
                  // contentPadding: _getContentPadding(),
                  floatingLabelBehavior: widget.floatingLabelBehavior ??
                      (widget.label == null
                          ? FloatingLabelBehavior.never
                          : FloatingLabelBehavior.auto),
                  hintText: widget.hintText,
                  hintStyle:
                      widget.hintStyle,
                  border: InputBorder.none,
                  isDense: true,
                ),
                autofocus: widget.autofocus,
                cursorColor: widget.cursorColor ?? AppColors.transparent,
                cursorHeight: widget.cursorHeight,
                style: widget.style ,
              ),
            ),
            // if (_checkRequired(isActiveRequired.value)) ...[
            //   const SizedBox(height: 2),
            //   Align(
            //     alignment: Alignment.centerLeft,
            //     child: Text(
            //       'Vui lòng không bỏ trống trường này',
            //       style: VTVStyle.smallRegular.red300,
            //     ),
            //   ),
            // ],
          ],
        );
  }

  // void initListenController() {
  //   (widget.controller ?? _textCTL)?.addListener(() {
  //     widget.onChanged?.call((widget.controller ?? _textCTL)?.text ?? '');
  //     if (widget.isRequired &&
  //         !isActiveRequired.value &&
  //         ((widget.controller ?? _textCTL)?.text ?? '').isNotEmpty) {
  //       isActiveRequired.value = true;
  //     }

  //     if (isShowClose && (widget.controller ?? _textCTL)!.text.isNotEmpty) {
  //       return;
  //     } else {
  //       if (mounted) {
  //         setState(() {
  //           isShowClose = _isShowClose;
  //         });
  //       }
  //     }
  //   });
  // }

  // Border _renderBorder(bool isActiveRequired) {
  //   if (widget.isRequired &&
  //       isActiveRequired &&
  //       ((widget.controller ?? _textCTL)?.text ?? '').isEmpty) {
  //     return Border.all(color: VTVColor.red300);
  //   }

  //   return Border.all(
  //     color: (widget.focusNode ?? _focusNode)?.hasFocus == true
  //         ? widget.focusColor
  //         : widget.borderColor,
  //   );
  // }

  // void _handleFocusChanged() {
  //   if (mounted) {
  //     if ((widget.focusNode ?? _focusNode)?.hasFocus == false) {
  //       setState(() {
  //         isShowClose = false;
  //       });
  //     } else if (((widget.controller ?? _textCTL)?.text ?? '').isNotEmpty) {
  //       setState(() {
  //         isShowClose = true;
  //       });
  //     }
  //   }
  // }

  // EdgeInsetsGeometry _getContentPadding() {
  //   if (widget.contentPadding != null) {
  //     return widget.contentPadding!;
  //   }

  //   return widget.label != null &&
  //           widget.floatingLabelBehavior != FloatingLabelBehavior.never
  //       ? const EdgeInsets.symmetric(vertical: 8, horizontal: 16)
  //       : const EdgeInsets.only(bottom: 16);
  // }

  // String _getLabel() {
  //   if ((widget.focusNode ?? _focusNode)?.hasFocus == true ||
  //       ((widget.controller ?? _textCTL)?.text ?? '').isNotEmpty ||
  //       widget.labelNoFocus.isEmpty) {
  //     return widget.label ?? '';
  //   }

  //   return widget.labelNoFocus;
  // }

  // bool _checkRequired(bool isActiveRequired) =>
  //     widget.isRequired &&
  //     isActiveRequired &&
  //     (widget.controller ?? _textCTL)!.text.isEmpty;

  // bool get _isShowClose {
  //   if ((widget.controller ?? _textCTL)!.text.isNotEmpty &&
  //       (widget.focusNode ?? _focusNode)?.hasFocus == true) {
  //     return true;
  //   }

  //   return false;
  // }

  // Widget _buildSuffixIcon() {
  //   if (widget.hasClearText && isShowClose) {
  //     return VTVGestureDetector(
  //       onTap: () {
  //         (widget.controller ?? _textCTL)?.clear();
  //         widget.onClearText?.call();
  //       },
  //       child: Container(
  //         padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
  //         child: Assets.icons.essential.close.svg(
  //           colorFilter: widget.clearTextColor.svgColor,
  //           height: 24,
  //           width: 24,
  //         ),
  //       ),
  //     );
  //   } else if (widget.suffixIcon != null) {
  //     return Container(
  //       padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
  //       height: 24,
  //       width: 24,
  //       child: widget.suffixIcon,
  //     );
  //   }

  //   return const SizedBox.shrink();
  // }

  // @override
  // void dispose() {
  //   (widget.controller ?? _textCTL)?.removeListener(() {});
  //   (widget.focusNode ?? _focusNode)?.removeListener(() {});
  //   _focusNode?.dispose();
  //   _textCTL?.dispose();

  //   super.dispose();
  // }
}
