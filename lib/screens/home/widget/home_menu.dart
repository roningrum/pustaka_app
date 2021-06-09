import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pustaka_app/screens/daftar_antrian/puskesmas_daftar_antrian.dart';
import 'package:pustaka_app/screens/home/widget/pustaka_menu.dart';
import 'package:pustaka_app/screens/lihat_antrian/puskesmas_lihat_antrian.dart';
import 'package:pustaka_app/screens/puskesmas/puskesmas_menu_screen.dart';
import 'package:pustaka_app/screens/test_buta_warna/pustaka_buta_warna.dart';
import 'package:pustaka_app/widget/custom_dialog_box.dart';
import 'package:pustaka_app/widget/daftar_kartu_obat_ke_puskesmas.dart';
import 'package:shimmer/shimmer.dart';

//home menu here

class HomeMenu extends StatefulWidget {
  const HomeMenu({Key key}) : super(key: key);

  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  bool isLoading = true;
  var size = 36.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(seconds: 5),
            () =>
            setState(() {
              isLoading = false;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              isLoading
                  ? menuLoading()
                  : PustakaMenu(
                  asset: 'assets/menu/puskesmas.svg',
                  title: "Puskesmas",
                  routePage: PuskesmasMenuScreen.id),
              isLoading
                  ? menuLoading()
                  : PustakaMenu(
                  asset: 'assets/menu/lihatantrian.svg',
                  title: "Lihat Antrian",
                  routePage: PuskesmasLihatAntrian.id),
              isLoading
                  ? menuLoading()
                  : PustakaMenu(
                  asset: 'assets/menu/daftarantri.svg',
                  title: "Daftar Antri",
                  routePage: PuskesmasDaftarAntrian.id),
            ],
          ),
          Divider(height: 16, color: Colors.transparent),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              isLoading
                  ? menuLoading()
                : PustakaMenu(
                    asset: 'assets/menu/riwayat.svg',
                    title: "Riwayat\nKunjungan", routePage: "",),
              isLoading
                  ? menuLoading()
                  : PustakaMenu(
                  asset: 'assets/menu/butawarna.svg',
                  title: "Test Buta\nWarna", routePage: "",),
              isLoading
                  ? menuLoading()
                  : PustakaMenu(
                asset: 'assets/menu/asahotak.svg',
                routePage: "",
                title: "Asah Otak",
              ),
            ],
          ),
        ],
      ),
    );
  }

// loading widget
  Widget menuLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size,
            height: size,
            decoration:
            BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
          ),
          Divider(height: 8),
          Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                  width: 48,
                  height: 24,
                  color: Colors.grey)
          )
        ],
      ),
    );
  }
}
