part of '../pages.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeNav>.reactive(
      viewModelBuilder: () => HomeNav(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: AppBar(
              brightness: Brightness.dark,
            ),
          ),
          body: getView(viewModel.currentIndex),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "$svgAsset/TrainNotif.svg",
                  color: (viewModel.currentIndex == 1) 
                      ? primaryColor : textColor,
                ),
                title: Text("Pengingat"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.tune),
                title: Text("Pengaturan"),
              )
            ],
            currentIndex: viewModel.currentIndex,
            onTap: viewModel.setIndex,
          ),
        );
      },
    );
  }

  Widget getView(int index) {
    switch (index) {
      case 0:
        return HomeView();
        break;
      case 1:
        return PengingatView();
        break;
      case 2:
        return PengaturanView();
        break;
      default:
        return HomeView();
    }
  }
}
