import 'package:eticaret/Mama/Mamalar.dart';
import 'package:eticaret/consts/mainPageConsts.dart';
import 'package:flutter/material.dart';

class Sepet extends StatefulWidget {
  Function callback;

  Sepet.name(this.callback);

  @override
  State<Sepet> createState() => _SepetState();
}

class _SepetState extends State<Sepet> {
  final Mamalar mama = Mamalar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          mama.toplamKacUrunSepette() == 0 ? SizedBox() : buildBottomAppBar(),
      appBar: buildAppBar(),
      body: mama.toplamKacUrunSepette() == 0
          ? Center(
              child: Text(
                "Sepette Hiç Ürün Yok",
                style: Sabitler.appBarBaslik,
              ),
            )
          : ListView.builder(
              itemCount: mama.sepetListeUzunlugu(),
              itemBuilder: (context, index) {
                List<int> sepet = mama.sepetiDondur();

                if (sepet[index] != 0) {
                  return sepetKarti(sepet, index);
                } else {
                  return const SizedBox();
                }
              }),
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      color: Colors.white,
      child: Expanded(
        child: Container(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.black),
            onPressed: () {},
            child: Text(
              "Satın Al",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Sabitler.appBarBackgroundColor,
      foregroundColor: Sabitler.appBarForegroundColor,
      title: Text("Sepet", style: Sabitler.appBarBaslik),
    );
  }

  Padding sepetKarti(List<int> sepet, int index) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: sepetUrunuCardDecoration(),
        height: 110,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: sepetUrunAdiveFiyat(index),
        ),
      ),
    );
  }

  BoxDecoration sepetUrunuCardDecoration() {
    return BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ]);
  }

  Row sepetUrunAdiveFiyat(int index) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    mama.mama_ad[index],
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "${mama.urunToplamFiyatDondur(index).roundToDouble()} TL",
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: sepetAdetEklemeCikarma(index),
        ),
      ],
    );
  }

  Row sepetAdetEklemeCikarma(int index) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: FractionallySizedBox(
            widthFactor: 0.5,
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                mama.sepettenUrunAzalt(index);
                setState(() {});
                widget.callback(mama.toplamKacUrunSepette());
              },
              child: Icon(Icons.remove),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            mama.urunToplamAdetDondur(index).toString(),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        Expanded(
          flex: 3,
          child: FractionallySizedBox(
            widthFactor: 0.5,
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                mama.sepetteUrunArttir(index);
                setState(() {});
                widget.callback(mama.toplamKacUrunSepette());
              },
              child: Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }

  Container urunFoto() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.red,
        image: const DecorationImage(
          fit: BoxFit.fitHeight,
          image: NetworkImage(
              "https://cdn.akakce.com/reflex/reflex-kitten-tavuklu-15-kg-yavru-kuru-z.jpg"),
        ),
      ),
    );
  }
}
