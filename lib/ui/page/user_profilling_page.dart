part of 'pages.dart';

class UserProfillingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserProfillingViewmodel>.reactive(
      viewModelBuilder: () => UserProfillingViewmodel(),
      builder: (context, viewmodel, child) {
        return Scaffold(
          appBar: noAppBar,
          body: Stack(
            children: [
              Align(
                alignment: Alignment(0, -1),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TopUserProfilling(),
                      CenterUserProfilling(),
                      Visibility(
                        visible: (viewmodel.selectStationList.length < 3),
                        child: CirculanButton(
                          onClick: viewmodel.addStatiunList,
                          buttonColor: accentColor,
                          child: Icon(
                            Icons.add,
                            color: whiteColor,
                            size: Sizes.dp32(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, 0.95),
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
            "Untuk menampilkan jadwal terbaru\npada halaman home nanti\n(Maksimal 3 stasiun)",
            fontSize: Sizes.dp16(context),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}

class CenterUserProfilling extends ViewModelWidget<UserProfillingViewmodel> {
  @override
  Widget build(BuildContext context, UserProfillingViewmodel viewModel) {
    return SizedBox(
      height: Sizes.dp49(context) * viewModel.selectStationList.length,
      child: removeScrollEffect(
        child: ListView.builder(
          itemCount: viewModel.selectStationList.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              background: Container(
                color: primaryColor,
                child: removeIcon(),
                width: Sizes.width(context) / 2,
                margin: EdgeInsets.symmetric(vertical: 2),
              ),
              onDismissed: (direction) {
                viewModel.removeStatiunList(index);
              },
              child: itemStatsiun(
                context,
                viewModel.selectStationList[index],
              ),
            );
          },
        ),
      ),
    );
  }
}

class BottomUserProfilling extends ViewModelWidget<UserProfillingViewmodel> {
  @override
  Widget build(BuildContext context, UserProfillingViewmodel viewModel) {
    return Container(
      width: Sizes.width(context),
      margin: EdgeInsets.symmetric(
        horizontal: Sizes.dp50(context),
      ),
      child: ActionButton(
        text: "Selesai",
        onClick: viewModel.navigateToHomePage,
        buttonColor: primaryColor,
      ),
    );
  }
}

Widget removeIcon() {
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

Widget itemStatsiun(BuildContext context, SelectedStation selectedStation) {
  return Row(
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
              Container(
                padding: EdgeInsets.all(Sizes.dp6(context)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: accentColor,
                ),
                child: SvgPicture.asset("$svgAsset/TrainStationIcon.svg"),
              ),
              SizedBox(width: Sizes.dp16(context)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Sizes.width(context) / 1.8,
                    child: TextFormat(
                      "Stasiun ${selectedStation.stationName}",
                      fontSize: Sizes.dp14(context),
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.start,
                      fontColor: textColor,
                    ),
                  ),
                  SizedBox(
                    width: Sizes.width(context) / 1.8,
                    child: TextFormat(
                      "${selectedStation.reason}",
                      fontSize: Sizes.dp12(context),
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
          padding: EdgeInsets.symmetric(vertical: Sizes.dp8(context)),
          child: Icon(
            Icons.arrow_left,
            color: whiteColor,
          ),
        ),
      )
    ],
  );
}
