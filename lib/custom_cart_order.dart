import 'package:app1_flutter_training/directory_file/capitalize_each_word.dart';
import 'package:flutter/material.dart';
import 'directory_file/dataApp.dart';
import 'directory_file/format_currency.dart';

class MyCartOrder extends StatelessWidget {
  MyCartOrder(
      {super.key,
      required this.index,
      required this.strImage,
      required this.strMenu,
      required this.price});
  final int index;
  final String strImage;
  final String strMenu;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              // menu picture
              flex: 1,
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(strImage),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                  color: Colors.blue[400],
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      capitalizeEachWord(strMenu),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w800,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Bakery & Cake . Breakfast . Snack",
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              FormatCurrency.convertToIdr(
                                      (listFoodPrice[index]), 0)
                                  .toString(),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.green[600],
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
