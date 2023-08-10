import 'package:app1_flutter_training/directory_file/dataApp.dart';
import 'package:app1_flutter_training/widget/custom_container.dart';
import 'package:flutter/material.dart';

import '../directory_file/dragable_sheet.dart';

class MenuPage_Snack extends StatefulWidget {
  @override
  State<MenuPage_Snack> createState() => _MenuPage_SnackState();
}

class _MenuPage_SnackState extends State<MenuPage_Snack> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView.builder(
              itemCount: listFoodImage.length,
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
                                    imageUrl: listFoodImage[index],
                                    menu: listFoodMenu[index],
                                    price: listFoodPrice[index]);
                              });
                        },
                        child: CustomBanner(
                            widthBanner: 180,
                            radiusBanner: 20,
                            imageUrl: listFoodImage[index],
                            H1: listFoodMenu[index],
                            H2: listFoodPrice[index]),
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
                                    imageUrl: listFoodImage2[index],
                                    menu: listFoodMenu2[index],
                                    price: listFoodPrice2[index]);
                              });
                        },
                        child: CustomBanner(
                            widthBanner: 180,
                            radiusBanner: 20,
                            imageUrl: listFoodImage2[index],
                            H1: listFoodMenu2[index],
                            H2: listFoodPrice2[index]),
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
