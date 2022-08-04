import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

typedef TextMorph = TextStyle Function(Color? color, [TextStyle? style]);
typedef TransformTextStyle = TextMorph Function(double);

const _defaultTextColor = Colors.black87;

///
/// * Use TextWidget.sizexx() to prevent size inconsistencies
/// * Use TextWidget.custom() to completely customize the text
/// * directly use TextWidget will use default style
///
class TextWidget extends StatelessWidget {
  TextWidget(
    this.text, {
    Key? key,
    this.maxLines,
    this.overflow,
    this.textAlign,
  })  : customStyle = defaultStyle,
        size = 0,
        font = null,
        miscStyle = null,
        color = null,
        super(key: key);

  const TextWidget.custom(
    this.text, {
    Key? key,
    required TextStyle style,
    this.maxLines,
    this.overflow,
    this.textAlign,
  })  : miscStyle = null,
        size = 0,
        font = null,
        color = null,
        customStyle = style,
        super(key: key);

  const TextWidget.size12(
    this.text, {
    Key? key,
    this.maxLines,
    this.overflow,
    this.color,
    this.font,
    this.miscStyle,
    this.textAlign,
  })  : size = 12,
        customStyle = null,
        super(key: key);

  const TextWidget.size14(
    this.text, {
    Key? key,
    this.maxLines,
    this.overflow,
    this.color,
    this.font,
    this.miscStyle,
    this.textAlign,
  })  : size = 14,
        customStyle = null,
        super(key: key);

  const TextWidget.size16(
    this.text, {
    Key? key,
    this.maxLines,
    this.overflow,
    this.color,
    this.font,
    this.miscStyle,
    this.textAlign,
  })  : size = 16,
        customStyle = null,
        super(key: key);

  const TextWidget.size20(
    this.text, {
    Key? key,
    this.maxLines,
    this.overflow,
    this.color,
    this.font,
    this.miscStyle,
    this.textAlign,
  })  : size = 20,
        customStyle = null,
        super(key: key);

  const TextWidget.size24(
    this.text, {
    Key? key,
    this.maxLines,
    this.overflow,
    this.color,
    this.font,
    this.miscStyle,
    this.textAlign,
  })  : size = 24,
        customStyle = null,
        super(key: key);

  const TextWidget.size29(
    this.text, {
    Key? key,
    this.maxLines,
    this.overflow,
    this.color,
    this.font,
    this.miscStyle,
    this.textAlign,
  })  : size = 29,
        customStyle = null,
        super(key: key);

  const TextWidget.size34(
    this.text, {
    Key? key,
    this.maxLines,
    this.overflow,
    this.color,
    this.font,
    this.miscStyle,
    this.textAlign,
  })  : size = 34,
        customStyle = null,
        super(key: key);

  const TextWidget.size40(
    this.text, {
    Key? key,
    this.maxLines,
    this.overflow,
    this.color,
    this.font,
    this.miscStyle,
    this.textAlign,
  })  : size = 40,
        customStyle = null,
        super(key: key);

  final String text;
  final double size;
  final int? maxLines;
  final TextOverflow? overflow;
  final Color? color;

  /// caution : overiddes morphStyle and miscStyle
  final TextStyle? customStyle;

  /// additiotal style that will be applied
  final TextStyle? miscStyle;

  /// default is interMedium
  final TransformTextStyle? font;

  final TextAlign? textAlign;

  TextStyle get style =>
      customStyle ??
      textStyle(
        size,
        font ?? interMedium,
        color,
        miscStyle,
      );

  static final TextStyle defaultStyle = textStyle(14, interMedium);

  @override
  Widget build(BuildContext context) => Text(
        text,
        key: key,
        maxLines: maxLines ?? 1,
        overflow: overflow ?? TextOverflow.ellipsis,
        softWrap: true,
        style: style,
        textAlign: textAlign,
      );
}

TextStyle textStyle(
  double input,
  TransformTextStyle tranform, [
  Color? color,
  TextStyle? style,
]) =>
    tranform(input)(color, style);

TextStyle _poppins({
  required double size,
  Color? color,
  required FontWeight weight,
  TextStyle? miscStyle,
}) =>
    GoogleFonts.poppins(
      fontSize: size,
      color: color ?? _defaultTextColor,
      fontWeight: weight,
      background: miscStyle?.background,
      backgroundColor: miscStyle?.backgroundColor,
      decoration: miscStyle?.decoration,
      decorationColor: miscStyle?.decorationColor,
      decorationStyle: miscStyle?.decorationStyle,
      decorationThickness: miscStyle?.decorationThickness,
      fontFeatures: miscStyle?.fontFeatures,
      fontStyle: miscStyle?.fontStyle,
      wordSpacing: miscStyle?.wordSpacing,
      foreground: miscStyle?.foreground,
      height: miscStyle?.height,
      letterSpacing: miscStyle?.letterSpacing,
      locale: miscStyle?.locale,
      shadows: miscStyle?.shadows,
      textBaseline: miscStyle?.textBaseline,
    );

TextStyle _inter({
  required double size,
  Color? color,
  required FontWeight weight,
  TextStyle? miscStyle,
}) =>
    GoogleFonts.inter(
      fontSize: size,
      color: color ?? _defaultTextColor,
      fontWeight: weight,
      background: miscStyle?.background,
      backgroundColor: miscStyle?.backgroundColor,
      decoration: miscStyle?.decoration,
      decorationColor: miscStyle?.decorationColor,
      decorationStyle: miscStyle?.decorationStyle,
      decorationThickness: miscStyle?.decorationThickness,
      fontFeatures: miscStyle?.fontFeatures,
      fontStyle: miscStyle?.fontStyle,
      wordSpacing: miscStyle?.wordSpacing,
      foreground: miscStyle?.foreground,
      height: miscStyle?.height,
      letterSpacing: miscStyle?.letterSpacing,
      locale: miscStyle?.locale,
      shadows: miscStyle?.shadows,
      textBaseline: miscStyle?.textBaseline,
    );

TextMorph poppinsLight(double s) => (
      Color? color, [
      TextStyle? style,
    ]) =>
        _poppins(
          size: s,
          color: color,
          weight: FontWeight.w300,
          miscStyle: style,
        );

TextMorph poppinsMedium(double s) => (
      Color? color, [
      TextStyle? style,
    ]) =>
        _poppins(
          size: s,
          color: color,
          weight: FontWeight.w500,
          miscStyle: style,
        );

TextMorph poppinsBold(double s) => (
      Color? color, [
      TextStyle? style,
    ]) =>
        _poppins(
          size: s,
          color: color,
          weight: FontWeight.w700,
          miscStyle: style,
        );

TextMorph poppinsExtraBold(double s) => (
      Color? color, [
      TextStyle? style,
    ]) =>
        _poppins(
          size: s,
          color: color,
          weight: FontWeight.w900,
          miscStyle: style,
        );

TextMorph interLight(double s) => (
      Color? color, [
      TextStyle? style,
    ]) =>
        _inter(
          size: s,
          color: color,
          weight: FontWeight.w300,
          miscStyle: style,
        );

TextMorph interMedium(double s) => (
      Color? color, [
      TextStyle? style,
    ]) =>
        _inter(
          size: s,
          color: color,
          weight: FontWeight.w500,
          miscStyle: style,
        );

TextMorph interBold(double s) => (
      Color? color, [
      TextStyle? style,
    ]) =>
        _inter(
          size: s,
          color: color,
          weight: FontWeight.w700,
          miscStyle: style,
        );

TextMorph interExtraBold(double s) => (
      Color? color, [
      TextStyle? style,
    ]) =>
        _inter(
          size: s,
          color: color,
          weight: FontWeight.w900,
          miscStyle: style,
        );
