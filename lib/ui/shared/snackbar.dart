part of 'shareds.dart';

enum SnackbarType { errorSnackbar, successSnackbar }

final _snackbarService = locator<SnackbarService>();

// -----------------
// Setup Snackbar
// -----------------
void setupSnackbar() {
  _snackbarService.registerCustomSnackbarConfig(
    variant: SnackbarType.errorSnackbar,
    config: SnackbarConfig(
      borderRadius: 16,
      borderWidth: 4,
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      backgroundColor: Colors.red,
      boxShadows: boxShadowBottom,
      icon: Icon(
        Icons.error,
        color: Colors.white,
      ),
    ),
  );

  _snackbarService.registerCustomSnackbarConfig(
    variant: SnackbarType.successSnackbar,
    config: SnackbarConfig(
      borderRadius: 16,
      borderWidth: 4,
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      backgroundColor: Color(0xff0C845B),
      boxShadows: boxShadowBottom,
      icon: Icon(
        Icons.check_circle,
        color: Colors.white,
      ),
    ),
  );
}

// ---------------------------
// Error & Success Snackbar
// ---------------------------
void showErrorSnackbar(String message, {int duration}) {
  _snackbarService.showCustomSnackBar(
    variant: SnackbarType.errorSnackbar,
    message: message,
    title: "Error",
    duration: Duration(seconds: duration ?? 2),
  );
}

void showSuccessSnackbar(String message, {int duration}) {
  _snackbarService.showCustomSnackBar(
    variant: SnackbarType.successSnackbar,
    message: message,
    title: "Success",
    duration: Duration(seconds: duration ?? 2),
  );
}

// ----------------------------------
// Custom Snackbar without Varians
// ----------------------------------
Future showCustomSnackbarWithoutVarians(
    {Key key,
    String title,
    @required String message,
    Widget titleText,
    Widget messageText,
    Widget icon,

    /// with instantInit = false you can put Get.snackbar on initState
    bool instantInit = false,
    bool shouldIconPulse = true,
    double maxWidth,
    EdgeInsets margin = const EdgeInsets.all(0.0),
    EdgeInsets padding = const EdgeInsets.all(16),
    double borderRadius = 0.0,
    Color borderColor,
    double borderWidth = 1.0,
    Color backgroundColor = const Color(0xFF303030),
    Color leftBarIndicatorColor,
    List<BoxShadow> boxShadows,
    Gradient backgroundGradient,
    FlatButton mainButton,
    OnTap onTap,
    Duration duration,
    bool isDismissible = true,
    SnackDismissDirection dismissDirection = SnackDismissDirection.VERTICAL,
    bool showProgressIndicator = false,
    AnimationController progressIndicatorController,
    Color progressIndicatorBackgroundColor,
    Animation<Color> progressIndicatorValueColor,
    SnackPosition snackPosition = SnackPosition.BOTTOM,
    SnackStyle snackStyle = SnackStyle.FLOATING,
    Curve forwardAnimationCurve = Curves.easeOutCirc,
    Curve reverseAnimationCurve = Curves.easeOutCirc,
    Duration animationDuration = const Duration(milliseconds: 300),
    SnackStatusCallback onStatusChanged,
    double barBlur = 0.0,
    double overlayBlur = 0.0,
    Color overlayColor = Colors.transparent,
    Form userInputForm}) {
  final getBar = GetBar(
      key: key,
      title: title,
      message: message,
      titleText: titleText,
      messageText: messageText,
      icon: icon,
      shouldIconPulse: shouldIconPulse,
      maxWidth: maxWidth,
      margin: margin,
      padding: padding,
      borderRadius: borderRadius,
      borderColor: borderColor,
      borderWidth: borderWidth,
      backgroundColor: backgroundColor,
      leftBarIndicatorColor: leftBarIndicatorColor,
      boxShadows: boxShadows,
      backgroundGradient: backgroundGradient,
      mainButton: mainButton,
      onTap: onTap,
      duration: duration,
      isDismissible: isDismissible,
      dismissDirection: dismissDirection,
      showProgressIndicator: showProgressIndicator,
      progressIndicatorController: progressIndicatorController,
      progressIndicatorBackgroundColor: progressIndicatorBackgroundColor,
      progressIndicatorValueColor: progressIndicatorValueColor,
      snackPosition: snackPosition,
      snackStyle: snackStyle,
      forwardAnimationCurve: forwardAnimationCurve,
      reverseAnimationCurve: reverseAnimationCurve,
      animationDuration: animationDuration,
      onStatusChanged: onStatusChanged,
      barBlur: barBlur,
      overlayBlur: overlayBlur,
      overlayColor: overlayColor,
      userInputForm: userInputForm);

  if (instantInit) {
    return getBar.show();
  } else {
    Completer completer = new Completer();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final result = await getBar.show();
      completer.complete(result);
    });
    return completer.future;
  }
}