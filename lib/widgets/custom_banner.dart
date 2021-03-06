import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:lodjinha/datas/banner_data.dart';
import 'package:lodjinha/services/banner_service.dart';

// ignore: must_be_immutable
class CustomBanner extends StatelessWidget {
  final double _heigth;
  var bannerService = BannerService();

  CustomBanner(this._heigth);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: bannerService.getBanner(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SliverToBoxAdapter(
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor),
                    ),
                  )
              ),
            );
          } else {
            return SliverToBoxAdapter(
                child: Container(
                    height:_heigth,
                    child: Carousel(
                        boxFit: BoxFit.fill,
                        images: snapshot.data["data"].map((url) {
                          BannerData banner = BannerData(url);
                          return Image.network(
                            banner.image,
                            fit: BoxFit.fill,
                            filterQuality: FilterQuality.high,
                          );
                        }).toList(),
                        dotSize: 5.0,
                        dotSpacing: 15.0,
                        dotBgColor: Colors.transparent,
                        dotColor: Theme.of(context).primaryColor,
                        autoplay: true,
                        autoplayDuration: Duration(seconds: 3),
                    ),
                ));
          }
        });
  }
}
