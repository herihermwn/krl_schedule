part of 'widgets.dart';

class BackIcon extends StatelessWidget {
  final BuildContext parentContext;
  BackIcon(this.parentContext);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(parentContext);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: Sizes.dp16(context),
          vertical: Sizes.dp14(context),
        ),
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
    );
  }
}
