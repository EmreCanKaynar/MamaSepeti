import 'package:badges/badges.dart';
import 'package:eticaret/Mama/Mamalar.dart';
import 'package:eticaret/consts/mainPageConsts.dart';
import 'package:eticaret/sayfalar/Mama.dart';
import 'package:eticaret/sayfalar/Sepet.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';

StreamController<int> streamController = StreamController<int>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late TabController tabController;
  int sepetAdetSayisi = 0;

  @override
  void initState() {
    sepetAdetSayisi = Mamalar().toplamKacUrunSepette();
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  void update(int newvalue) {
    sepetAdetSayisi = newvalue;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMainPage(),
      body: TabBarView(
        controller: tabController,
        children: [
          Mama.name("kedi", update),
          Mama.name("kopek", update),
          Mama.name("kus", update),
        ],
      ),
    );
  }

  AppBar AppBarMainPage() {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Sepet.name(update),
              ),
            );
          },
          icon: Badge(
              position: BadgePosition.bottomStart(),
              badgeContent: Mamalar().toplamKacUrunSepette().toInt() == 0
                  ? null
                  : Text(
                      Mamalar().toplamKacUrunSepette().toString(),
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
              child: const FaIcon(FontAwesomeIcons.cartShopping)),
        )
      ],
      bottom: tabBar(),
      centerTitle: true,
      backgroundColor: Sabitler.appBarBackgroundColor,
      foregroundColor: Sabitler.appBarForegroundColor,
      elevation: 1,
      title: Text(
        "Mama Sepeti",
        style: Sabitler.appBarBaslik,
      ),
    );
  }

  TabBar tabBar() {
    return TabBar(
      labelStyle: Sabitler.tabBarTextStyle,
      labelColor: Colors.red,
      indicatorColor: Colors.red,
      controller: tabController,
      tabs: const [
        Tab(text: "Kedi"),
        Tab(text: "Köpek"),
        Tab(text: "Kuş"),
      ],
    );
  }
}
