part of 'widgets.dart';

/// Custom Raised Button
///
/// * Function `onClick` must `Future<void> Function()`
///
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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 20;
    return RaisedButton(
      color: (isOnProgress)
          ? Colors.grey.withOpacity(0.5)
          : buttonColor ?? Colors.green,
      onPressed: () async {
        if (!isOnProgress) {
          isOnProgress = true;
          setState(() {});
          onClick().whenComplete(() {
            setState(() {
              isOnProgress = false;
            });
          });
        }
      },
      child: (isOnProgress)
          ? SizedBox(
              height: width,
              width: width,
              child: CircularProgressIndicator(
                strokeWidth: 5,
                backgroundColor: Colors.green,
              ),
            )
          : TextFormat(
              text ?? "",
              fontSize: 14,
              fontColor: textColor ?? Colors.white,
            ),
    );
  }
}
