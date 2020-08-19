part of 'pages.dart';

class UserProfillingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserProfillingViewmodel>.nonReactive(
      viewModelBuilder: () => UserProfillingViewmodel(),
      builder: (context, viewmodel, child) {
        return Scaffold(
          appBar: getAppBar,
          backgroundColor: Color(0xffF8F8F8),
          body: Stack(
            children: [
              Align(
                alignment: Alignment(0, -1),
                child: Column(
                  children: [
                    TopUserProfilling(),
                    CenterUserProfilling(),
                    CirculanButton(
                      onClick: viewmodel.addStatiunList,
                      buttonColor: accentColor,
                      child: Icon(
                        Icons.add,
                        color: whiteColor,
                        size: Sizes.dp32(context),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment(0, 1),
                child: BottomUserProfilling(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class TopUserProfilling extends ViewModelWidget<UserProfillingViewmodel> {
  TopUserProfilling({Key key}) : super(key: key, reactive: false);

  @override
  Widget build(BuildContext context, UserProfillingViewmodel viewModel) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Sizes.dp26(context),
        horizontal: Sizes.dp30(context),
      ),
      width: Sizes.width(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormat(
            "Pilih Stasiun",
            fontSize: Sizes.dp24(context),
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w600,
          ),
          TextFormat(
            "Untuk menampilkan jadwal terbaru\npada halaman home nanti",
            fontSize: Sizes.dp16(context),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}

class CenterUserProfilling extends ViewModelWidget<UserProfillingViewmodel> {
  CenterUserProfilling({Key key}) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, UserProfillingViewmodel viewModel) {
    return SizedBox(
      height: Sizes.dp48(context) * viewModel.selectedStation.length,
      child: ListView.builder(
        itemCount: viewModel.selectedStation.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(viewModel.selectedStation[index].stationId),
            direction: DismissDirection.endToStart,
            background: Container(
              color: primaryColor,
              child: _removeIcon(),
            ),
            onDismissed: (direction) {
              viewModel.removeStatiunList(index);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 17,
                  child: Container(
                    margin: EdgeInsets.only(
                      left: Sizes.dp32(context),
                      top: Sizes.dp10(context),
                      bottom: Sizes.dp10(context),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: Sizes.dp12(context),
                      horizontal: Sizes.dp16(context),
                    ),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: boxShadowBottom,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset("$svgAsset/TrainStationIcon.svg"),
                        SizedBox(width: Sizes.dp18(context)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Sizes.width(context) / 1.8,
                              child: TextFormat(
                                "Stasiun ${viewModel.selectedStation[index].stationName}",
                                fontSize: Sizes.dp16(context),
                                fontWeight: FontWeight.w600,
                                textAlign: TextAlign.start,
                                fontColor: textColor,
                              ),
                            ),
                            SizedBox(
                              width: Sizes.width(context) / 1.8,
                              child: TextFormat(
                                "${viewModel.selectedStation[index].reason}",
                                fontSize: Sizes.dp14(context),
                                textAlign: TextAlign.start,
                                fontColor: textColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: SizedBox(),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                    ),
                    height: Size.fromHeight(Sizes.width(context) / 5.2).height,
                    child: Icon(
                      Icons.arrow_left,
                      color: whiteColor,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class BottomUserProfilling extends ViewModelWidget<UserProfillingViewmodel> {
  BottomUserProfilling({Key key}) : super(key: key, reactive: true);

  @override
  Widget build(BuildContext context, UserProfillingViewmodel viewModel) {
    return Container(
      width: Sizes.width(context),
      margin: EdgeInsets.symmetric(
          vertical: Sizes.dp24(context), horizontal: Sizes.dp50(context)),
      child: ActionButton(
        text: "Selesai",
        onClick: viewModel.navigateToHomePage,
        buttonColor: primaryColor,
      ),
    );
  }
}

Widget _removeIcon() {
  return Stack(
    children: [
      Align(
        alignment: Alignment(0.2, 0),
        child: Icon(
          Icons.clear,
          color: whiteColor,
        ),
      ),
      Align(
        alignment: Alignment(0.5, 0),
        child: TextFormat(
          "Hapus",
          fontColor: whiteColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
