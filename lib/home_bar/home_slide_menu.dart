import 'package:app1_flutter_training/directory_file/dataApp.dart';
import 'package:app1_flutter_training/directory_file/dragable_sheet.dart';
import 'package:app1_flutter_training/widget/custom_container.dart';
import 'package:flutter/material.dart';

class SlideMenu extends StatefulWidget {
  const SlideMenu({super.key});

  @override
  State<SlideMenu> createState() => _SlideMenuState();
}

class _SlideMenuState extends State<SlideMenu> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // membatasi list builder ke bawah
      height: 220,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listMenu.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 15),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(30))),
                      context: context,
                      builder: (context) {
                        return MyDragableSheet(
                            imageUrl: listImage[index],
                            menu: listMenu[index],
                            price: listPrice[index]);
                      });
                },
                child: CustomBanner(
                  imageUrl: listImage[index],
                  H1: listMenu[index],
                  H2: listPrice[index],
                  radiusBanner: 15,
                  widthBanner: 130,
                ),
              ),
            );
          }),
    );
  }
}
