import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

typedef TextMorph = Function(Color? color, [TextStyle? style]);
typedef TransformTextStyle = TextMorph Function(double);

TextStyle textStyle(
  double input,
  TransformTextStyle tranform, [
  Color? color,
  TextStyle? style,
]) =>
    tranform(input)(color, style);

class TextWidget extends StatelessWidget {
  TextWidget(
    this.text, {
    Key? key,
    this.maxLines,
    this.overflow,
    this.color,
    this.miscStyle,
  })  : customStyle = defaultStyle,
        size = 0,
        font = null,
        super(key: key);

  const TextWidget.size12(
    this.text, {
    Key? key,
    this.maxLines,
    this.overflow,
    this.color,
    this.font,
    this.customStyle,
    this.miscStyle,
  })  : size = 12,
        super(key: key);

  const TextWidget.size14(
    this.text, {
    Key? key,
    this.maxLines,
    this.overflow,
    this.color,
    this.font,
    this.customStyle,
    this.miscStyle,
  })  : size = 14,
        super(key: key);

  const TextWidget.size16(
    this.text, {
    Key? key,
    this.maxLines,
    this.overflow,
    this.color,
    this.font,
    this.customStyle,
    this.miscStyle,
  })  : size = 16,
        super(key: key);

  const TextWidget.size20(
    this.text, {
    Key? key,
    this.maxLines,
    this.overflow,
    this.color,
    this.font,
    this.customStyle,
    this.miscStyle,
  })  : size = 20,
        super(key: key);

  const TextWidget.size24(
    this.text, {
    Key? key,
    this.maxLines,
    this.overflow,
    this.color,
    this.font,
    this.customStyle,
    this.miscStyle,
  })  : size = 24,
        super(key: key);

  const TextWidget.size29(
    this.text, {
    Key? key,
    this.maxLines,
    this.overflow,
    this.color,
    this.font,
    this.customStyle,
    this.miscStyle,
  })  : size = 29,
        super(key: key);

  const TextWidget.size34(
    this.text, {
    Key? key,
    this.maxLines,
    this.overflow,
    this.color,
    this.font,
    this.customStyle,
    this.miscStyle,
  })  : size = 34,
        super(key: key);

  const TextWidget.size40(
    this.text, {
    Key? key,
    this.maxLines,
    this.overflow,
    this.color,
    this.font,
    this.customStyle,
    this.miscStyle,
  })  : size = 40,
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

  /// default is inter medium
  final TransformTextStyle? font;

  TextStyle get style =>
      customStyle ?? textStyle(size, font ?? interMedium, color, miscStyle);

  static final TextStyle defaultStyle = textStyle(14, interMedium);

  @override
  Widget build(BuildContext context) => Text(
        text,
        key: key,
        maxLines: maxLines,
        overflow: overflow,
        softWrap: true,
        style: style,
      );
}

const _defaultColor = Colors.black87;

TextStyle _poppins({
  required double size,
  Color? color,
  required FontWeight weight,
  TextStyle? miscStyle,
}) =>
    GoogleFonts.poppins(
      fontSize: size,
      color: color ?? _defaultColor,
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
      color: color ?? _defaultColor,
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

TextMorph poppinsLight(double s) {
  return (
    Color? color, [
    TextStyle? style,
  ]) =>
      _poppins(
        size: s,
        color: color,
        weight: FontWeight.w300,
      );
}

TextMorph poppinsMedium(double s) {
  return (
    Color? color, [
    TextStyle? style,
  ]) =>
      _poppins(
        size: s,
        color: color,
        weight: FontWeight.w500,
      );
}

TextMorph poppinsBold(double s) {
  return (
    Color? color, [
    TextStyle? style,
  ]) =>
      _poppins(
        size: s,
        color: color,
        weight: FontWeight.w700,
      );
}

TextMorph poppinsExtraBold(double s) {
  return (
    Color? color, [
    TextStyle? style,
  ]) =>
      _poppins(
        size: s,
        color: color,
        weight: FontWeight.w900,
      );
}

TextMorph interLight(double s) {
  return (
    Color? color, [
    TextStyle? style,
  ]) =>
      _inter(
        size: s,
        color: color,
        weight: FontWeight.w300,
      );
}

TextMorph interMedium(double s) {
  return (
    Color? color, [
    TextStyle? style,
  ]) =>
      _inter(
        size: s,
        color: color,
        weight: FontWeight.w500,
      );
}

TextMorph interBold(double s) {
  return (
    Color? color, [
    TextStyle? style,
  ]) =>
      _inter(
        size: s,
        color: color,
        weight: FontWeight.w700,
      );
}

TextMorph interExtraBold(double s) {
  return (
    Color? color, [
    TextStyle? style,
  ]) =>
      _inter(
        size: s,
        color: color,
        weight: FontWeight.w900,
      );
}
