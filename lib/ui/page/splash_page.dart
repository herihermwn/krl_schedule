part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewmodel>.reactive(
      viewModelBuilder: () => SplashViewmodel(),
      builder: (context, viewmodel, child) {
        if (viewmodel.isBusy) {
          viewmodel.getToken();
        }
        return Scaffold(
          body: Container(
            color: primaryColor,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment(0, -0.5),
                  child: SvgPicture.asset(
                    "$svgAsset/Icon.svg",
                    semanticsLabel: 'Train Icon',
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.1),
                  child: TextFormat(
                    "KRL Schedule",
                    fontColor: whiteColor,
                    fontSize: Sizes.dp22(context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0.8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormat(
                        viewmodel.getMessage,
                        fontColor: whiteColor,
                        fontSize: Sizes.dp16(context),
                      ),
                      SizedBox(height: Sizes.dp14(context)),
                      CircularProgressIndicator(),
                      SizedBox(height: Sizes.dp14(context)),
                      (viewmodel.isBusy)
                          ? SizedBox()
                          : TextFormat(
                              viewmodel.data,
                              fontColor: whiteColor,
                              fontSize: Sizes.dp14(context),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
