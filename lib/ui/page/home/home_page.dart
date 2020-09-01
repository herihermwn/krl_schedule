part of '../pages.dart';

class HomeView extends StatefulWidget {
  final List<SelectedStation> stationList;
  HomeView(this.stationList);

  @override
  _HomeViewState createState() => _HomeViewState(stationList);
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  final List<SelectedStation> stationList;
  _HomeViewState(this.stationList);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewmodel>.reactive(
      viewModelBuilder: () => HomeViewmodel(this, this.stationList),
      builder: (context, viewmodel, child) {
        return Scaffold(
          appBar: noAppBar,
          body: NestedScrollView(
            controller: viewmodel.scrollViewController,
            headerSliverBuilder: (BuildContext context, bool isScrolled) {
              return <Widget>[
                SliverAppBar(
                  flexibleSpace: HeaderHomePage(),
                  collapsedHeight: Sizes.dp47(context),
                  pinned: true,
                  forceElevated: isScrolled,
                  bottom: TabBar(
                    tabs: viewmodel.tab,
                    indicatorSize: TabBarIndicatorSize.tab,
                    isScrollable: true,
                    controller: viewmodel.tabController,
                    labelPadding: EdgeInsets.symmetric(
                      horizontal: Sizes.width(context) / (4 * viewmodel.stationList.length),
                    ),
                    indicator: BubbleTabIndicator(
                      insets: EdgeInsets.symmetric(vertical: -4),
                      indicatorColor: accentColor,
                      tabBarIndicatorSize: TabBarIndicatorSize.tab,
                    ),
                  ),
                ),
              ];
            },
            body: condition(
              value: viewmodel.schedule.isNotEmpty,
              onTrue: BodyHomePage(),
              onFalse: Center(
                child: SizedBox(
                  width: Sizes.dp32(context),
                  height: Sizes.dp32(context),
                  child: CircularProgressIndicator(),
                ),
              ),
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
          width: Sizes.dp34(context),
          height: Sizes.dp34(context),
          padding: EdgeInsets.all(4),
          child: SvgPicture.asset("$svgAsset/$svg"),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: whiteColor,
          ),
        ),
        SizedBox(height: Sizes.dp4(context)),
        TextFormat(
          title,
          fontColor: whiteColor,
          fontSize: Sizes.dp12(context),
        ),
      ],
    );
  }
}

class BodyHomePage extends ViewModelWidget<HomeViewmodel> {

  @override
  Widget build(BuildContext context, HomeViewmodel viewmodel) {
    return TabBarView(
      controller: viewmodel.tabController,
      children: viewmodel.schedule.map((e) => trainList(e.data)).toList(),
    );
  }

  Widget trainList(List<ScheduleStationData> schedule) {
    return (schedule != null)
        ? ListView.builder(
            itemCount: schedule.length,
            itemBuilder: (context, index) {
              return trainItem(schedule[index]);
            },
          )
        : Center(
            child: TextFormat("Jadwal kosong"),
          );
  }

  Widget trainItem(ScheduleStationData schedule) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 8,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(4),
        boxShadow: boxShadowBottom,
      ),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Column(
                children: [
                  SvgPicture.asset(
                    "$svgAsset/Train.svg",
                    color: schedule.cColor.toColor(),
                  ),
                  SizedBox(height: 4),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 4,
                    ),
                    decoration: BoxDecoration(
                      color: schedule.cColor.toColor(),
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: boxShadowBottom,
                    ),
                    child: TextFormat(
                      schedule.kaId,
                      fontColor: whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormat("Tujuan"),
                TextFormat(
                  schedule.tujuan,
                  fontWeight: FontWeight.w600,
                ),
                TextFormat("Rute"),
                TextFormat(
                  schedule.routeName,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                TextFormat("Tiba dalam"),
                TextFormat(
                  differenceCurrentTime(schedule.waktuTiba),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
