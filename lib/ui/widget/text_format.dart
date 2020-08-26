part of 'widgets.dart';

class TextFormat extends StatelessWidget {
  final String value;
  final Color fontColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final FontStyle fontStyle;

  TextFormat(
    this.value, {
    this.fontColor,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.fontStyle,
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
        fontStyle: fontStyle ?? FontStyle.normal,
      ),
    );
  }
}
