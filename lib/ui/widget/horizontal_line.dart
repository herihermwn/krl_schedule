part of 'widgets.dart';

class HorizontalLine extends StatelessWidget {
  final double size;
  final Color color;

  HorizontalLine({
    this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: color ?? Colors.black87,
      height: size ?? 2,
    );
  }
}
