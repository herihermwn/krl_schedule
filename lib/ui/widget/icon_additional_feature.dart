part of 'widgets.dart';

class IconAdditionalFeatures extends StatelessWidget {
  final String asset;
  final String title;
  final Function onClick;
  final double size;

  IconAdditionalFeatures({
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image.asset(
            asset,
            height: size,
            width: size,
          ),
          SizedBox(
            height: size / 15,
          ),
          SizedBox(
            width: size * 3,
            height: size / 2,
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
