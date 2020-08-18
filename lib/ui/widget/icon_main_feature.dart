part of 'widgets.dart';

class IconMainFeature extends StatelessWidget {
  final String asset;
  final String title;
  final Function onClick;
  final double size;

  IconMainFeature({
    @required this.asset,
    @required this.title,
    @required this.size,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Column(
        children: <Widget>[
          Image.asset(
            asset,
            height: size,
            width: size,
          ),
          SizedBox(height: size / 15),
          SizedBox(
            width: size,
            height: size / 1.8,
            child: TextFormat(
              title,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
