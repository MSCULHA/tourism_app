import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:tourism_app/model/content.dart';

String mert = "AmerikaGezilecekYerler";
String exitData;
class TipServices {
  getTipContent(String city, String travelName, String contentTip) async {
    var diziSorgula = await Firestore.instance
        .collection("post")
        .where("mainName", isEqualTo: city)
        .where("travelName", isEqualTo: travelName )
        .where("contentTip", isEqualTo: contentTip)
        .getDocuments();

  }

  getContentCategory(String city, String travelName,) async {
    var diziSorgula = await Firestore.instance
        .collection("contents")
        .where("contentName", isEqualTo: city)
        .where(travelName)
        .getDocuments();
    for (var dokuman in diziSorgula.documents) {
      debugPrint('Dizi Şartı ile getirenler' + dokuman.data.toString());
      exitData = dokuman.data.toString();

    }
  }


  getTodoContent(String city, String travelName) async {
    var diziSorgula = await Firestore.instance
        .collection("post")
        .where("mainName", isEqualTo: city)
        .where("travelName", isEqualTo: travelName )
        .getDocuments();
    for (var dokuman in diziSorgula.documents) {
      debugPrint('Dizi Şartı ile getirenler' + dokuman.data.toString());
      exitData = dokuman.data["todo"];

    }
  }



  getCategories(String city, String travelName,) async {
    var diziSorgula = await Firestore.instance
        .collection("categories")
        .where("cityName", isEqualTo: city)
        .where("$travelName" ,arrayContains: travelName )
        .getDocuments();
    for (var dokuman in diziSorgula.documents) {
      debugPrint('Dizi Şartı ile getirenler' + dokuman.data.toString());
      exitData = dokuman.data.toString();
      return dokuman.data;


    }
  }
}




