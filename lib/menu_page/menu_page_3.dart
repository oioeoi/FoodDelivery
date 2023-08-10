import 'package:app1_flutter_training/directory_file/dataApp.dart';
import 'package:app1_flutter_training/widget/custom_container.dart';
import 'package:flutter/material.dart';

import '../directory_file/dragable_sheet.dart';

class MenuPage_Drink extends StatefulWidget {
  @override
  State<MenuPage_Drink> createState() => _MenuPage_DrinkState();
}

class _MenuPage_DrinkState extends State<MenuPage_Drink> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView.builder(
              itemCount: listDrinkImage.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(30))),
                              context: context,
                              builder: (context) {
                                return MyDragableSheet(
                                    imageUrl: listDrinkImage[index],
                                    menu: listDrinkMenu[index],
                                    price: listDrinkPrice[index]);
                              });
                        },
                        child: CustomBanner(
                            widthBanner: 180,
                            radiusBanner: 20,
                            imageUrl: listDrinkImage[index],
                            H1: listDrinkMenu[index],
                            H2: listDrinkPrice[index]),
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(30))),
                              context: context,
                              builder: (context) {
                                return MyDragableSheet(
                                    imageUrl: listDrinkImage2[index],
                                    menu: listDrinkMenu2[index],
                                    price: listDrinkPrice2[index]);
                              });
                        },
                        child: CustomBanner(
                            widthBanner: 180,
                            radiusBanner: 20,
                            imageUrl: listDrinkImage2[index],
                            H1: listDrinkMenu2[index],
                            H2: listDrinkPrice2[index]),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
