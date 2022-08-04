import 'package:flutter/material.dart';

class Mamalar {
  //sepet
  static List<int> sepet_mama_adet = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  // varsayımsal veritabanı--> mama bilgileri

  List<String> mama_ad = [
    "Reflex Kitten Tavuklu Yavru Kedi Maması 15kg",
    "Proplan Pro Plan Junior Tavuklu Yavru Kedi Maması 1,5 Kg",
    "Whiskas Tavuk & Sebze Kedi Maması 1,4 kg",
    "Goody Yüksek Enerji Yetişkin Köpek Maması 15 kg",
    "Promax Kuzu Etli Köpek Maması 15 Kg.",
    "Pro Line Dog Lamb&Rice Adult Kuzu Etli Pirinçli Yetişkin Köpek Maması 3kg",
    "İksir Prof Kuş Mamasi Kuş Maması 1 kg",
    "Quik Muhabbet Kuşu Yemi 400 Gr",
    "Garden Mix Parekeets Papağan Yemi 500 Gr"
  ];
  List<double> mama_fiyat = [
    55.90,
    199.0,
    64.99,
    239.90,
    222.30,
    106.0,
    50.0,
    38.0,
    19.0
  ];
  List<String> mama_foto_url = [
    "https://cdn.akakce.com/reflex/reflex-kitten-tavuklu-15-kg-yavru-kuru-z.jpg",
    "https://www.juenpetmarket.com/Content/_userfiles/images/28500/Org/JPM028239_1.jpg",
    "https://www.petlebi.com/up/ecommerce/product/lg_whiskas-yavru-kedi-mamasi-300kg-104033580.jpg",
    "https://cdn.cimri.io/image/1000x1000/goodyiftlikyetikinkgkpekmamas_59057853.jpg",
    "https://productimages.hepsiburada.net/s/49/1500/11009015775282.jpg",
    "https://cdn.cimri.io/image/1000x1000/prolinekuzuetlivepirinlikgyetikinkpekmamas_600005574.jpg",
    "https://productimages.hepsiburada.net/s/49/500/11001998934066.jpg",
    "https://productimages.hepsiburada.net/s/4/500/9639144652850.jpg",
    "https://productimages.hepsiburada.net/s/18/500/9814572105778.jpg"
  ];

  void sepeteUrunEkle(int index) {
    sepet_mama_adet[index]++;
  }

  void sepettekiUrunleriSil() {
    for (int i = 0; i < sepet_mama_adet.length; i++) {
      sepet_mama_adet[i] = 0;
    }
    print("sepet temizlendi");
  }

  void _alisverisiTamamla() {
    print("alisveris tamamlandi");
    sepettekiUrunleriSil();
  }

  void sepettekiUrunleriGoster() {
    for (int i = 0; i < sepet_mama_adet.length; i++) {
      print(sepet_mama_adet[i].toString() + " adet mama var");
      print("\n");
    }
  }

  List<int> sepetiDondur() {
    return sepet_mama_adet;
  }

  int sepetListeUzunlugu() {
    return sepet_mama_adet.length;
  }

  double urunToplamFiyatDondur(int index) {
    return mama_fiyat[index] * sepet_mama_adet[index];
  }

  void sepettenUrunAzalt(int index) {
    --sepet_mama_adet[index];
  }

  void sepetteUrunArttir(int index) {
    ++sepet_mama_adet[index];
  }

  int urunToplamAdetDondur(int index) {
    return sepet_mama_adet[index];
  }

  int toplamKacUrunSepette() {
    int toplamAdet = 0;
    for (int i = 0; i < sepet_mama_adet.length; i++) {
      toplamAdet += sepet_mama_adet[i];
    }
    print("toplam $toplamAdet ürün sepette");
    return toplamAdet;
  }

  double sepetToplamFiyat() {
    double toplamfiyat = 0;
    if (toplamKacUrunSepette() == 0) {
      return 0;
    } else {
      for (int i = 0; i < sepet_mama_adet.length; i++) {
        if (sepet_mama_adet[i] == 0) {
          continue;
        } else {
          toplamfiyat += mama_fiyat[i] * sepet_mama_adet[i];
        }
      }
    }
    print(toplamfiyat);
    return toplamfiyat.roundToDouble();
  }
}
