import 'package:app1_flutter_training/custom_cart_order.dart';
import 'package:app1_flutter_training/directory_file/dataApp.dart';
import 'package:app1_flutter_training/widget/custom_container.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../directory_file/dragable_sheet.dart';

class MenuPage_popular extends StatefulWidget {
  @override
  State<MenuPage_popular> createState() => _MenuPage_popularState();
}

class _MenuPage_popularState extends State<MenuPage_popular> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.27,
        child: CarouselSlider(
          carouselController: CarouselController(),
          options: CarouselOptions(
              pageSnapping: false,
              viewportFraction: 0.35,
              autoPlay: true,
              autoPlayCurve: Curves.easeInOut,
              autoPlayInterval: Duration(seconds: 4),
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom),
          items: listImage.map((i) {
            int index = listImage.indexOf(i);
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
              },
            );
          }).toList(),
        ),
      ),
      Flexible(
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                color: Colors.grey[100],
                height: 2,
                width: double.infinity,
              ),
            );
          },
          shrinkWrap: true,
          controller: ScrollController(),
          itemCount: listFoodImage.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30))),
                    context: context,
                    builder: (context) {
                      return MyDragableSheet(
                          imageUrl: listFoodImage[index],
                          menu: listFoodMenu[index],
                          price: listFoodPrice[index]);
                    });
              },
              child: MyCartOrder(
                  index: index,
                  strImage: listFoodImage[index],
                  strMenu: listFoodMenu[index],
                  price: listFoodPrice[index]),
            );
          }),
        ),
      )
    ]);
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
