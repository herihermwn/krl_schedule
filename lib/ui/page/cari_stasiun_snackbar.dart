part of 'pages.dart';

class SearchStasiun extends StatelessWidget {
  final List<SelectedStation> currentStation;

  SearchStasiun({this.currentStation});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchStasiunViewmodel>.reactive(
      viewModelBuilder: () => SearchStasiunViewmodel(currentStation),
      builder: (context, viewmodel, child) {
        return Container(
          color: whiteColor,
          height: Sizes.height(context) / 1.3,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: Sizes.dp16(context),
                  left: Sizes.dp16(context),
                  right: Sizes.dp16(context),
                  bottom: Sizes.dp4(context),
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: InputField(
                  controller: viewmodel.queryController,
                  inputType: TextInputType.text,
                  textColor: Colors.black54,
                  hint: "ex: Manggarai",
                ),
              ),
              (viewmodel.isBusy)
                  ? CircularProgressIndicator()
                  : Expanded(
                      child: removeScrollEffect(
                        child: ListView.builder(
                          itemCount: viewmodel.stationList.length,
                          itemBuilder: (c, i) => StatiunItemList(i),
                        ),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}

class StatiunItemList extends ViewModelWidget<SearchStasiunViewmodel> {
  final int index;

  StatiunItemList(this.index);

  @override
  Widget build(BuildContext context, SearchStasiunViewmodel viewmodel) {
    bool isSelect = (viewmodel.currentStation != null)
        ? viewmodel.checkStationId(index)
        : false;
    SelectedStation item = viewmodel.stationList[index];

    return GestureDetector(
      onTap: () {
        if (isSelect) {
          viewmodel.itemHasSelected();
        } else {
          viewmodel.selectStasiun(item);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.dp8(context),
          vertical: Sizes.dp10(context),
        ),
        color: (isSelect) ? accentColor : whiteColor,
        child: Row(
          children: [
            Checkbox(
              value: isSelect,
              onChanged: null,
              hoverColor: Colors.red,
              focusColor: Colors.amber,
              activeColor: Colors.green,
            ),
            TextFormat(
              "Stasiun " + item.stationName,
              fontSize: Sizes.dp14(context),
              fontWeight: (isSelect) ? FontWeight.w600 : FontWeight.w400,
              fontColor: (isSelect) ? whiteColor : darkTextColor,
            ),
          ],
        ),
      ),
    );
  }
}
