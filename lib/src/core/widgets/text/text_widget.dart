import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      customStyle ?? textStyle(size, font ?? interMedium, color);

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

typedef FontFamilyCallable = Function(double?);
typedef FontWeightSizeCallable = Function(FontWeight, Color?);

TextMorph poppinsLight(double s) {
  return (
    Color? color, [
    TextStyle? style,
  ]) =>
      GoogleFonts.poppins(
        fontSize: s,
        color: color ?? Colors.black87,
        fontWeight: FontWeight.w300,
        background: style?.background,
        backgroundColor: style?.backgroundColor,
        decoration: style?.decoration,
        decorationColor: style?.decorationColor,
        decorationStyle: style?.decorationStyle,
        decorationThickness: style?.decorationThickness,
        fontFeatures: style?.fontFeatures,
        fontStyle: style?.fontStyle,
        wordSpacing: style?.wordSpacing,
        foreground: style?.foreground,
        height: style?.height,
        letterSpacing: style?.letterSpacing,
        locale: style?.locale,
        shadows: style?.shadows,
        textBaseline: style?.textBaseline,
      );
}

TextMorph poppinsMedium(double s) {
  return (
    Color? color, [
    TextStyle? style,
  ]) =>
      GoogleFonts.poppins(
        fontSize: s,
        color: color ?? Colors.black87,
        fontWeight: FontWeight.w400,
        background: style?.background,
        backgroundColor: style?.backgroundColor,
        decoration: style?.decoration,
        decorationColor: style?.decorationColor,
        decorationStyle: style?.decorationStyle,
        decorationThickness: style?.decorationThickness,
        fontFeatures: style?.fontFeatures,
        fontStyle: style?.fontStyle,
        wordSpacing: style?.wordSpacing,
        foreground: style?.foreground,
        height: style?.height,
        letterSpacing: style?.letterSpacing,
        locale: style?.locale,
        shadows: style?.shadows,
        textBaseline: style?.textBaseline,
      );
}

TextMorph poppinsBold(double s) {
  return (
    Color? color, [
    TextStyle? style,
  ]) =>
      GoogleFonts.poppins(
        fontSize: s,
        color: color ?? Colors.black87,
        fontWeight: FontWeight.w700,
        background: style?.background,
        backgroundColor: style?.backgroundColor,
        decoration: style?.decoration,
        decorationColor: style?.decorationColor,
        decorationStyle: style?.decorationStyle,
        decorationThickness: style?.decorationThickness,
        fontFeatures: style?.fontFeatures,
        fontStyle: style?.fontStyle,
        wordSpacing: style?.wordSpacing,
        foreground: style?.foreground,
        height: style?.height,
        letterSpacing: style?.letterSpacing,
        locale: style?.locale,
        shadows: style?.shadows,
        textBaseline: style?.textBaseline,
      );
}

TextMorph poppinsExtraBold(double s) {
  return (
    Color? color, [
    TextStyle? style,
  ]) =>
      GoogleFonts.poppins(
        fontSize: s,
        color: color ?? Colors.black87,
        fontWeight: FontWeight.w900,
        background: style?.background,
        backgroundColor: style?.backgroundColor,
        decoration: style?.decoration,
        decorationColor: style?.decorationColor,
        decorationStyle: style?.decorationStyle,
        decorationThickness: style?.decorationThickness,
        fontFeatures: style?.fontFeatures,
        fontStyle: style?.fontStyle,
        wordSpacing: style?.wordSpacing,
        foreground: style?.foreground,
        height: style?.height,
        letterSpacing: style?.letterSpacing,
        locale: style?.locale,
        shadows: style?.shadows,
        textBaseline: style?.textBaseline,
      );
}

TextMorph interLight(double s) {
  return (
    Color? color, [
    TextStyle? style,
  ]) =>
      GoogleFonts.poppins(
        fontSize: s,
        color: color ?? Colors.black87,
        fontWeight: FontWeight.w300,
        background: style?.background,
        backgroundColor: style?.backgroundColor,
        decoration: style?.decoration,
        decorationColor: style?.decorationColor,
        decorationStyle: style?.decorationStyle,
        decorationThickness: style?.decorationThickness,
        fontFeatures: style?.fontFeatures,
        fontStyle: style?.fontStyle,
        wordSpacing: style?.wordSpacing,
        foreground: style?.foreground,
        height: style?.height,
        letterSpacing: style?.letterSpacing,
        locale: style?.locale,
        shadows: style?.shadows,
        textBaseline: style?.textBaseline,
      );
}

TextMorph interMedium(double s) {
  return (
    Color? color, [
    TextStyle? style,
  ]) =>
      GoogleFonts.poppins(
        fontSize: s,
        color: color ?? Colors.black87,
        fontWeight: FontWeight.w400,
        background: style?.background,
        backgroundColor: style?.backgroundColor,
        decoration: style?.decoration,
        decorationColor: style?.decorationColor,
        decorationStyle: style?.decorationStyle,
        decorationThickness: style?.decorationThickness,
        fontFeatures: style?.fontFeatures,
        fontStyle: style?.fontStyle,
        wordSpacing: style?.wordSpacing,
        foreground: style?.foreground,
        height: style?.height,
        letterSpacing: style?.letterSpacing,
        locale: style?.locale,
        shadows: style?.shadows,
        textBaseline: style?.textBaseline,
      );
}

TextMorph interBold(double s) {
  return (
    Color? color, [
    TextStyle? style,
  ]) =>
      GoogleFonts.poppins(
        fontSize: s,
        color: color ?? Colors.black87,
        fontWeight: FontWeight.w600,
        background: style?.background,
        backgroundColor: style?.backgroundColor,
        decoration: style?.decoration,
        decorationColor: style?.decorationColor,
        decorationStyle: style?.decorationStyle,
        decorationThickness: style?.decorationThickness,
        fontFeatures: style?.fontFeatures,
        fontStyle: style?.fontStyle,
        wordSpacing: style?.wordSpacing,
        foreground: style?.foreground,
        height: style?.height,
        letterSpacing: style?.letterSpacing,
        locale: style?.locale,
        shadows: style?.shadows,
        textBaseline: style?.textBaseline,
      );
}

TextMorph interExtraBold(double s) {
  return (
    Color? color, [
    TextStyle? style,
  ]) =>
      GoogleFonts.poppins(
        fontSize: s,
        color: color ?? Colors.black87,
        fontWeight: FontWeight.w900,
        background: style?.background,
        backgroundColor: style?.backgroundColor,
        decoration: style?.decoration,
        decorationColor: style?.decorationColor,
        decorationStyle: style?.decorationStyle,
        decorationThickness: style?.decorationThickness,
        fontFeatures: style?.fontFeatures,
        fontStyle: style?.fontStyle,
        wordSpacing: style?.wordSpacing,
        foreground: style?.foreground,
        height: style?.height,
        letterSpacing: style?.letterSpacing,
        locale: style?.locale,
        shadows: style?.shadows,
        textBaseline: style?.textBaseline,
      );
}

TextStyle italic(TextStyle s) => s.copyWith(fontStyle: FontStyle.italic);

typedef TransformSize = TextStyle Function(double);
typedef TextMorph = Function(Color? color, [TextStyle? style]);
typedef TransformTextStyle = TextMorph Function(double);
typedef StyleFunction = TextStyle Function(
    double input, TransformSize tranform);

TextStyle textStyle(
  double input,
  TransformTextStyle tranform, [
  Color? color,
  TextStyle? style,
]) =>
    tranform(input)(color, style);
