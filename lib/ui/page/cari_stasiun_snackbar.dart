part of 'pages.dart';

class SearchStasiun extends StatelessWidget {
  final Function(SelectedStation) onChange;
  final SelectedStation currentStation;

  SearchStasiun({this.onChange, this.currentStation});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchStasiunViewmodel>.reactive(
      viewModelBuilder: () => SearchStasiunViewmodel(onChange, currentStation),
      builder: (context, viewmodel, child) {
        return Container(
          height: Sizes.height(context) / 1.3,
          padding: EdgeInsets.all(Sizes.dp16(context)),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          child: Column(
            children: [
              InputField(
                controller: viewmodel.queryController,
                inputType: TextInputType.text,
                textColor: Colors.black54,
                hint: "ex: Manggarai",
              ),
              (viewmodel.isBusy)
                  ? CircularProgressIndicator()
                  : Expanded(
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (overscroll) {
                          overscroll.disallowGlow();
                          return true;
                        },
                        child: ListView.builder(
                          itemCount: viewmodel.stationList.length,
                          itemBuilder: (c, i) {
                            return _buildStatiunItemList(
                              c,
                              viewmodel.stationList[i],
                              viewmodel.selectStasiun,
                              (viewmodel.currentStation != null)
                                  ? (viewmodel.stationList[i].stationId ==
                                      viewmodel.currentStation.stationId)
                                  : false,
                            );
                          },
                        ),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatiunItemList(BuildContext context, SelectedStation item,
      Function(SelectedStation item) onClick, bool isSelect) {
    return GestureDetector(
      onTap: () {
        onClick(item);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: Sizes.dp12(context),
          horizontal: Sizes.dp8(context),
        ),
        child: Row(
          children: [
            CircularCheckBox(
              value: isSelect,
              materialTapTargetSize: MaterialTapTargetSize.padded,
              onChanged: (newValue) {
                onClick(item);
              },
            ),
            TextFormat(
              "Stasiun " + item.stationName,
              fontSize: Sizes.dp14(context),
            ),
          ],
        ),
      ),
    );
  }
}
