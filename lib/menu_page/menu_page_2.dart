import 'package:app1_flutter_training/directory_file/dataApp.dart';
import 'package:app1_flutter_training/widget/custom_container.dart';
import 'package:flutter/material.dart';
import '../directory_file/dragable_sheet.dart';

class MenuPage_Food extends StatefulWidget {
  @override
  State<MenuPage_Food> createState() => _MenuPage_FoodState();
}

class _MenuPage_FoodState extends State<MenuPage_Food> {
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

  Card cardContoh() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 90,
              height: 90,
              margin: const EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1528735602780-2552fd46c7af?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1173&q=80",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(16.0),
                ),
                color: Colors.blue[400],
              ),
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6.0),
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.green[800],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          12.0,
                        ),
                      ),
                    ),
                    child: const Text(
                      "PROMO",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Roti bakar Cimanggis",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "8.1 km",
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      const Icon(
                        Icons.circle,
                        size: 4.0,
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orange[400],
                        size: 16.0,
                      ),
                      const Text(
                        "4.8",
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  const Text(
                    "Bakery & Cake . Breakfast . Snack",
                    style: TextStyle(
                      fontSize: 10.0,
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  const Text(
                    "€24",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
