part of 'widgets.dart';

class CirculanButton extends StatefulWidget {
  final Future<void> Function() onClick;
  final Color buttonColor;
  final Color childColor;
  final Widget child;

  CirculanButton({
    @required this.onClick,
    this.buttonColor,
    this.childColor,
    @required this.child,
  });

  @override
  _CirculanButtonState createState() => _CirculanButtonState(
        this.onClick,
        this.buttonColor,
        this.childColor,
        this.child,
      );
}

class _CirculanButtonState extends State<CirculanButton> {
  final Future<void> Function() onClick;
  final Color buttonColor;
  final Color childdColor;
  final Widget child;

  _CirculanButtonState(
      this.onClick, this.buttonColor, this.childdColor, this.child);

  bool isOnProgress = false;
  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (!isOnProgress) {
          isOnProgress = true;
          setState(() {
            onHover = false;
          });
          onClick().whenComplete(() {
            setState(() {
              isOnProgress = false;
            });
          });
        }
      },
      onTapDown: (detail) {
        setState(() {
          onHover = true;
        });
      },
      onTapCancel: () {
        setState(() {
          onHover = false;
        });
      },
      child: Container(
        padding: EdgeInsets.all(Sizes.dp4(context)),
        decoration: BoxDecoration(
          boxShadow: (onHover) ? [] : boxShadowBottom,
          borderRadius: BorderRadius.circular(Sizes.dp50(context)),
          color: (isOnProgress)
              ? Colors.grey.withOpacity(0.5)
              : buttonColor ?? Colors.green,
        ),
        child: child ?? Icon(Icons.plus_one),
      ),
    );
  }
}
