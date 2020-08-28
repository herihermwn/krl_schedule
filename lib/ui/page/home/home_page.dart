part of '../pages.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewmodel>.nonReactive(
      viewModelBuilder: () => HomeViewmodel(),
      builder: (context, viewmodel, child) {
        return Scaffold(
          appBar: noAppBar,
          body: SingleChildScrollView(
            child: Column(
              children: [
                HeaderHomePage(),
                BodyHomePage(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HeaderHomePage extends ViewModelWidget<HomeViewmodel> {
  HeaderHomePage() : super(reactive: false);

  @override
  Widget build(BuildContext context, HomeViewmodel viewmodel) {
    return Container(
      height: Sizes.dp51(context),
      margin: EdgeInsets.only(bottom: Sizes.dp12(context)),
      padding: EdgeInsets.only(top: Sizes.dp18(context)),
      decoration: BoxDecoration(
        color: primaryColor,
        boxShadow: boxShadowBottom,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Sizes.dp16(context)),
          bottomRight: Radius.circular(Sizes.dp16(context)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: iconWidget(
              "Clock.svg",
              "Jadwal",
              context,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: iconWidget(
              "Rp.svg",
              "Periksa Tarif",
              context,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: iconWidget(
              "Map.svg",
              "Peta Rute",
              context,
            ),
          ),
        ],
      ),
    );
  }

  Widget iconWidget(String svg, String title, BuildContext context) {
    return Column(
      children: [
        Container(
          width: Sizes.dp42(context),
          height: Sizes.dp42(context),
          padding: EdgeInsets.all(8),
          child: SvgPicture.asset("$svgAsset/$svg"),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: whiteColor,
          ),
        ),
        SizedBox(height: Sizes.dp8(context)),
        TextFormat(
          title,
          fontColor: whiteColor,
          fontSize: Sizes.dp15(context),
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}

class BodyHomePage extends ViewModelWidget<HomeViewmodel> {
  BodyHomePage() : super(reactive: false);

  @override
  Widget build(BuildContext context, HomeViewmodel viewmodel) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Sizes.dp16(context)),
      child: Column(
        children: [
          warningWidget(context),
          SizedBox(height: Sizes.dp32(context)),
          jadwalTerkini(context),
        ],
      ),
    );
  }

  Widget warningWidget(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.warning,
          color: yellowColor,
          size: Sizes.dp32(context),
        ),
        SizedBox(width: Sizes.dp16(context)),
        SizedBox(
          width: Sizes.width(context) / 1.4,
          child: TextFormat(
            "Selalu jaga jarak dan perhatikan barang bawaan anda",
            fontColor: Colors.black87,
            fontSize: Sizes.dp14(context),
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  Widget jadwalTerkini(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: Sizes.width(context),
          child: TextFormat(
            "Informasi jadwal terkini",
            fontColor: Colors.black87,
            fontSize: Sizes.dp14(context),
            fontWeight: FontWeight.bold,
          ),
        ),
        StasiunList(),
      ],
    );
  }
}

class StasiunList extends ViewModelWidget<HomeViewmodel> {
  @override
  Widget build(BuildContext context, HomeViewmodel viewmodel) {
    return conditionWidget(
      value: viewmodel.stationProses,
      onFalse: CircularProgressIndicator(),
      onTrue: SizedBox(
        height: Sizes.height(context) / 3.3 * viewmodel.stationList.length,
        child: removeScrollEffect(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: viewmodel.stationList.length,
            itemBuilder: (c, i) {
              return Column(
                children: <Widget>[
                  stasiunItem(
                    station: viewmodel.stationList[i],
                    context: context,
                  ),
                  conditionWidget(
                    value: viewmodel.scheduleProses,
                    onFalse: CircularProgressIndicator(),
                    onTrue: SizedBox(
                      height: Sizes.dp51(context),
                      width: Sizes.width(context),
                      child: ListView.builder(
                        itemCount: viewmodel.schedule[i].data.length,
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (c, j) {
                          return trainItem(
                            schedule: viewmodel.schedule[i].data[j],
                            context: c,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget stasiunItem({SelectedStation station, BuildContext context}) {
    return Container(
      margin: EdgeInsets.only(
        left: Sizes.dp4(context),
        right: Sizes.dp4(context),
        top: Sizes.dp16(context),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.dp8(context),
        vertical: Sizes.dp12(context),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        boxShadow: boxShadowBottom,
        color: whiteColor,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: Sizes.dp8(context),
              ),
              margin: EdgeInsets.symmetric(
                horizontal: Sizes.dp6(context),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: accentColor,
              ),
              child: SvgPicture.asset("$svgAsset/TrainStationIcon.svg"),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(
            flex: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormat(
                  "Stasiun ${station.stationName}",
                  fontSize: Sizes.dp14(context),
                  fontColor: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: Sizes.dp4(context)),
                TextFormat(
                  station.reason,
                  fontSize: Sizes.dp13(context),
                  fontColor: darkTextColor,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Icon(Icons.tune),
          ),
        ],
      ),
    );
  }

  Widget trainItem({ScheduleStationData schedule, BuildContext context}) {
    return Container(
      width: Sizes.width(context) / 2.8,
      margin: EdgeInsets.symmetric(
        horizontal: Sizes.dp8(context),
        vertical: Sizes.dp16(context),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.dp8(context),
        vertical: Sizes.dp4(context),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        boxShadow: boxShadowBottom,
        color: whiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(Sizes.dp6(context)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: schedule.cColor.toColor(),
                  ),
                  child: SvgPicture.asset("$svgAsset/TrainStationIcon.svg"),
                ),
              ),
              Expanded(
                flex: 3,
                child: TextFormat(
                  schedule.routeName,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.dp32(context),
              vertical: Sizes.dp4(context),
            ),
            decoration: BoxDecoration(
              color: yellowColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormat(schedule.waktuTiba),
          ),
        ],
      ),
    );
  }
}
