part of 'widgets.dart';

/// Custom Raised Button
///
/// * Function `onClick` must `Future<void> Function()`
///
class ActionButton extends StatefulWidget {
  final Future<void> Function() onClick;
  final Color buttonColor;
  final Color textColor;
  final String text;

  ActionButton({
    @required this.text,
    @required this.onClick,
    this.buttonColor,
    this.textColor,
  });

  @override
  _ActionButtonState createState() => _ActionButtonState(
        this.onClick,
        this.buttonColor,
        this.textColor,
        this.text,
      );
}

class _ActionButtonState extends State<ActionButton> {
  final Future<void> Function() onClick;
  final Color buttonColor;
  final Color textColor;
  final String text;

  _ActionButtonState(this.onClick, this.buttonColor, this.textColor, this.text);

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
      child: condition(
        value: isOnProgress,
        onTrue: Container(
          margin: EdgeInsets.symmetric(horizontal: Sizes.dp47(context)),
          child: CircularProgressIndicator(),
        ),
        onFalse: Container(
          padding: EdgeInsets.symmetric(
            vertical: Sizes.dp14(context),
            horizontal: Sizes.dp24(context),
          ),
          decoration: BoxDecoration(
            boxShadow: (onHover) ? [] : boxShadowBottom,
            borderRadius: BorderRadius.circular(8),
            color: (isOnProgress)
                ? Colors.grey.withOpacity(0.5)
                : buttonColor ?? Colors.green,
          ),
          child: TextFormat(
            text ?? "",
            fontSize: Sizes.dp16(context),
            fontColor: textColor ?? Colors.white,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
