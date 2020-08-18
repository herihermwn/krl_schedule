part of 'widgets.dart';

class TextFormat extends StatelessWidget {
  final String value;
  final Color fontColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  TextFormat(
    this.value, {
    this.fontColor,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      textAlign: textAlign ?? TextAlign.start,
      softWrap: true,
      style: GoogleFonts.raleway(
        color: fontColor ?? Colors.black87,
        fontSize: fontSize ?? 12,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}
