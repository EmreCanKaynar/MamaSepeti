import 'package:eticaret/Mama/Mamalar.dart';
import 'package:eticaret/main.dart';
import 'package:flutter/material.dart';

class Mama extends StatefulWidget {
  String mamaTuru;
  Function callback;

  Mama.name(this.mamaTuru, this.callback);

  @override
  State<Mama> createState() => _MamaState();
}

class _MamaState extends State<Mama> {
  int startIndex = 0;
  @override
  void initState() {
    if (widget.mamaTuru == "kedi") {
      startIndex = 0;
    } else if (widget.mamaTuru == "kopek") {
      startIndex = 3;
    } else if (widget.mamaTuru == "kus") {
      startIndex = 6;
    }
    super.initState();
  }

  final Mamalar mamalar = Mamalar();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Mamalar().mama_ad.length - 6,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red.shade100,
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [Colors.black, Colors.red],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            width: 100,
            height: 200,
            child: Row(
              children: [
                mamaFoto(index + startIndex, context),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          Mamalar().mama_ad[index + startIndex],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          "${Mamalar().mama_fiyat[index + startIndex]} TL",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            mamalar.sepeteUrunEkle(index + startIndex);
                            mamalar.sepettekiUrunleriGoster();
                            mamalar.toplamKacUrunSepette();
                            mamalar.sepetToplamFiyat();
                            widget.callback(mamalar.toplamKacUrunSepette());
                          },
                          child: Text("Ürünü Sepete Ekle"),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.black),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Padding mamaFoto(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                Mamalar().mama_foto_url[index],
              ),
            )),
        width: MediaQuery.of(context).size.width * 0.40,
        height: double.infinity,
      ),
    );
  }
}
