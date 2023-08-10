import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PromoCard extends StatefulWidget {
  @override
  State<PromoCard> createState() => _PromoCardState();
}

class _PromoCardState extends State<PromoCard> {
  List promoCard = [
    'https://i.pinimg.com/474x/a4/34/76/a43476df2ef6ac373a4ece975d337ef2.jpg',
    'https://i.pinimg.com/474x/bb/a2/28/bba228c5324f2373347d2596e00c88c1.jpg',
    'https://i.pinimg.com/564x/fc/22/03/fc22030af2bd384f17bbcd74044c88da.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: CarouselSlider(
          carouselController: CarouselController(),
          options: CarouselOptions(
              pageSnapping: false,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayCurve: Curves.easeInOut,
              autoPlayInterval: Duration(seconds: 4),
              enlargeCenterPage: true,
            ),
          items: promoCard.map((i) {
            int index = promoCard.indexOf(i);
            return Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(30))),
                            context: context,
                            builder: (context) {
                              return Container(
                                width: double.infinity,
                                height: 120,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    image: DecorationImage(
                                        image: NetworkImage(promoCard[index]),
                                        fit: BoxFit.cover)),
                              );
                            });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            image: DecorationImage(
                                image: NetworkImage(promoCard[index]),
                                fit: BoxFit.cover)),
                      )),
                );
              },
            );
          }).toList(),
        ));
    //
  }
}
