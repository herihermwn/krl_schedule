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
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Icon(Icons.arrow_back_ios, color: Colors.black54),
      ),
    );
  }
}
