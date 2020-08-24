part of 'pages.dart';

class TambahStasiunPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TambahStasiunViewmodel>.reactive(
      viewModelBuilder: () => TambahStasiunViewmodel(),
      builder: (context, viewmodel, child) {
        return Scaffold(
          appBar: noAppBar,
          body: Stack(
            children: [
              Align(
                alignment: Alignment(0, -1),
                child: buildHeaderPage(
                  context: context,
                  title: "Tambahkan Stasiun",
                ),
              ),
              Align(
                alignment: Alignment(0, -0.7),
                child: Container(
                  width: Sizes.width(context),
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizes.dp24(context),
                    vertical: Sizes.dp12(context),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormat(
                        "Pilih Stasiun",
                        fontSize: Sizes.dp16(context),
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: Sizes.dp8(context)),
                      InkWell(
                        onTap: viewmodel.cariStasiun,
                        child: InputField(
                          controller: viewmodel.stasiunController,
                          isInputEnable: false,
                          inputType: TextInputType.emailAddress,
                          textColor: Colors.black54,
                          hint: "Stasiun",
                          prefixIcon: Container(
                            padding: EdgeInsets.all(Sizes.dp12(context)),
                            child: SvgPicture.asset(
                              "$svgAsset/Union.svg",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Sizes.dp24(context)),
                      TextFormat(
                        "Alasan singkat",
                        fontSize: Sizes.dp16(context),
                        fontWeight: FontWeight.w600,
                      ),
                      TextFormat(
                        "Berikan alasan singkat mengapa anda memilih stasiun ini",
                        fontSize: Sizes.dp14(context),
                      ),
                      SizedBox(height: Sizes.dp12(context)),
                      InputField(
                        controller: viewmodel.alasanController,
                        inputType: TextInputType.text,
                        textColor: Colors.black54,
                        maxInput: 50,
                        hint: "ex: Karena dekat dengan tempat tinggal",
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, 0.95),
                child: SizedBox(
                  width: Sizes.width(context) / 2,
                  child: ActionButton(
                    text: "Tambahkan",
                    buttonColor: primaryColor,
                    onClick: viewmodel.tambahkanStasiun,
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

