part of 'widgets.dart';

class BannerImage extends StatelessWidget {
  final String imgUrl;
  final String title;
  final double imageSize;
  final Function onClick;

  BannerImage(this.imgUrl,
      {@required this.imageSize, this.title, this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Column(
        children: <Widget>[
          Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Container(
              width: imageSize * 1.5,
              height: imageSize,
              padding: EdgeInsets.all(8),
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          (title != null) ? TextFormat(title) : SizedBox()
        ],
      ),
    );
  }
}
