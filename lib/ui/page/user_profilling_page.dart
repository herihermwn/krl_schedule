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
                        visible: (viewmodel.selectStationList.length < 5),
                        child: CirculanButton(
                          onClick: viewmodel.addItem,
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
            "Untuk menampilkan jadwal terbaru\npada halaman home nanti\n(Maksimal 5 stasiun)",
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
      height: Sizes.dp47(context) * viewModel.selectStationList.length,
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
                viewModel.removeItem(index);
              },
              child: ItemStation(index),
            );
          },
        ),
      ),
    );
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
}

class ItemStation extends ViewModelWidget<UserProfillingViewmodel> {
  final int index;
  ItemStation(this.index, {Key key}) : super(key: key, reactive: false);

  @override
  Widget build(BuildContext context, UserProfillingViewmodel viewModel) {
    return Container(
      padding: EdgeInsets.all(Sizes.dp12(context)),
      margin: EdgeInsets.symmetric(
        vertical: Sizes.dp8(context),
        horizontal: Sizes.dp24(context),
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: boxShadowBottom,
        borderRadius: BorderRadius.circular(4)
      ),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(Sizes.dp6(context)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: accentColor,
              ),
              child: SvgPicture.asset("$svgAsset/TrainStationIcon.svg"),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.dp12(context),
                vertical: Sizes.dp6(context),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormat(
                "Stasiun ${viewModel.selectStationList[index].stationName}",
                fontSize: 15,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: () async => viewModel.removeItem(index),
              child: Container(
                padding: EdgeInsets.all(Sizes.dp6(context)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: primaryColor,
                ),
                child: Icon(
                  Icons.clear,
                  color: whiteColor,
                ),
              ),
            ),
          ),
        ],
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
