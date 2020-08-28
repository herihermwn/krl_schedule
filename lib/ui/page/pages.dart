// ---------------
// Barrel File
// ---------------

// Import package
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:krl_schedule/core/model/models.dart';
import 'package:krl_schedule/core/viewmodel/viewmodels.dart';
import 'package:krl_schedule/ui/shared/shareds.dart';
import 'package:krl_schedule/ui/widget/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:supercharged/supercharged.dart';

// --------
// Child
// --------
part 'splash_page.dart';
part 'user_profilling_page.dart';
part 'tambah_stasiun.dart';
part 'cari_stasiun_snackbar.dart';
// Home Page
part 'home/main.dart';
part 'home/home_page.dart';
part 'home/pengaturan_page.dart';
part 'home/pengingat_page.dart';

// ----------
// Template
// ----------
Widget buildTitleHeader(
    {@required BuildContext context, @required String title}) {
  return Container(
    width: Sizes.width(context),
    height: Sizes.dp43(context),
    decoration: BoxDecoration(
      color: primaryColor,
      boxShadow: boxShadowBottom,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(Sizes.dp8(context)),
        bottomRight: Radius.circular(Sizes.dp8(context)),
      ),
    ),
    child: Stack(
      children: [
        Align(
          alignment: Alignment(-1, 0),
          child: BackIcon(context),
        ),
        Align(
          alignment: Alignment(0, 0),
          child: TextFormat(
            title,
            fontColor: whiteColor,
            fontSize: Sizes.dp16(context),
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}