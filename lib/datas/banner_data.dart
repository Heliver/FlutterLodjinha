import 'package:flutter/material.dart';

class BannerData {
     int id;
     String image;
     String link;

    BannerData(Map banner) {
      id    = banner["id"];
      image = banner["urlImagem"];
      link  = banner["linkUrl"];
    }
}