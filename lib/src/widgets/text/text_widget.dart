import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum FontFamily {
  inter,
  poppins,
}

class TextWidget extends StatelessWidget {
  const TextWidget(this.text, {Key? key, required this.size, required this.weight, this.maxLines, this.overflow, this.color, this.family}) : super(key: key);

  const TextWidget.light12(this.text, {Key? key,  this.size = 12, this.weight = FontWeight.w200, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);
  const TextWidget.light16(this.text, {Key? key,  this.size = 16, this.weight = FontWeight.w200, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);
  const TextWidget.light18(this.text, {Key? key,  this.size = 18, this.weight = FontWeight.w200, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);
  const TextWidget.light22(this.text, {Key? key,  this.size = 22, this.weight = FontWeight.w200, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);
  const TextWidget.light26(this.text, {Key? key,  this.size = 26, this.weight = FontWeight.w200, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);
  const TextWidget.light28(this.text, {Key? key,  this.size = 28, this.weight = FontWeight.w200, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);
  const TextWidget.light34(this.text, {Key? key,  this.size = 34, this.weight = FontWeight.w200, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);
  const TextWidget.light40(this.text, {Key? key,  this.size = 40, this.weight = FontWeight.w200, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);

  const TextWidget.medium12(this.text, {Key? key,  this.size = 12, this.weight = FontWeight.w400, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);
  const TextWidget.medium16(this.text, {Key? key,  this.size = 16, this.weight = FontWeight.w400, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);
  const TextWidget.medium18(this.text, {Key? key,  this.size = 18, this.weight = FontWeight.w400, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);
  const TextWidget.medium22(this.text, {Key? key,  this.size = 22, this.weight = FontWeight.w400, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);
  const TextWidget.medium26(this.text, {Key? key,  this.size = 26, this.weight = FontWeight.w400, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);
  const TextWidget.medium28(this.text, {Key? key,  this.size = 28, this.weight = FontWeight.w400, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);
  const TextWidget.medium34(this.text, {Key? key,  this.size = 34, this.weight = FontWeight.w400, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);
  const TextWidget.medium40(this.text, {Key? key,  this.size = 40, this.weight = FontWeight.w400, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);

  const TextWidget.bold12(this.text, {Key? key,  this.size = 12, this.weight = FontWeight.w700, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);
  const TextWidget.bold16(this.text, {Key? key,  this.size = 16, this.weight = FontWeight.w700, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);
  const TextWidget.bold18(this.text, {Key? key,  this.size = 18, this.weight = FontWeight.w700, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);
  const TextWidget.bold22(this.text, {Key? key,  this.size = 22, this.weight = FontWeight.w700, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);
  const TextWidget.bold26(this.text, {Key? key,  this.size = 26, this.weight = FontWeight.w700, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);
  const TextWidget.bold28(this.text, {Key? key,  this.size = 28, this.weight = FontWeight.w700, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);
  const TextWidget.bold34(this.text, {Key? key,  this.size = 34, this.weight = FontWeight.w700, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);
  const TextWidget.bold40(this.text, {Key? key,  this.size = 40, this.weight = FontWeight.w700, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);

  const TextWidget.xbold12(this.text, {Key? key,  this.size = 12, this.weight = FontWeight.w900, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);
  const TextWidget.xbold16(this.text, {Key? key,  this.size = 16, this.weight = FontWeight.w900, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);
  const TextWidget.xbold18(this.text, {Key? key,  this.size = 18, this.weight = FontWeight.w900, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);
  const TextWidget.xbold22(this.text, {Key? key,  this.size = 22, this.weight = FontWeight.w900, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);
  const TextWidget.xbold26(this.text, {Key? key,  this.size = 26, this.weight = FontWeight.w900, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);
  const TextWidget.xbold28(this.text, {Key? key,  this.size = 28, this.weight = FontWeight.w900, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);
  const TextWidget.xbold34(this.text, {Key? key,  this.size = 34, this.weight = FontWeight.w900, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);
  const TextWidget.xbold40(this.text, {Key? key,  this.size = 40, this.weight = FontWeight.w900, this.maxLines = 1, this.overflow = TextOverflow.clip, this.color, this.family = FontFamily.inter}) : super(key: key);

  final String text;
  final double size;
  final FontWeight weight;
  final int? maxLines;
  final TextOverflow? overflow;
  final Color? color;
  final FontFamily? family;

  @override
  Widget build(BuildContext context) => Text(
        text,
        key: key,
        maxLines: maxLines,
        overflow: overflow,
        softWrap: true,
        style: () {
          switch (family) {
            case FontFamily.inter:
              return GoogleFonts.inter(
                color: color,
                fontSize: size,
                fontWeight: weight,
              );
            case FontFamily.poppins:
              return GoogleFonts.poppins(
                color: color,
                fontSize: size,
                fontWeight: weight,
              );
            default:
            return TextStyle(
                color: color,
                fontSize: size,
                fontWeight: weight,
              );
          }
        }() ,
      );
}
