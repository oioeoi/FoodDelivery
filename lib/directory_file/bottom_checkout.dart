import 'package:flutter/material.dart';

import 'dataApp.dart';
import 'format_currency.dart';

class MyBottomCheckOut extends StatefulWidget {
  const MyBottomCheckOut(
      {required this.imageUrl, required this.menu, required this.price});
  final imageUrl;
  final menu;
  final price;

  @override
  State<MyBottomCheckOut> createState() => _MyBottomCheckOutState();
}

class _MyBottomCheckOutState extends State<MyBottomCheckOut> {
  int point = 1;
  String imageUrl = '';
  String menu = '';
  int price = 1;

  @override
  void initState() {
    super.initState();
    imageUrl = widget.imageUrl;
    menu = widget.menu;
    price = widget.price;
  }
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            minimumSize: Size(double.infinity, 50),
            backgroundColor: Colors.green[400]),
        onPressed: () {
          setState(() {
            cartListImage.add(imageUrl);
            cartListMenu.add(menu);
            cartListPrice.add(price * point);
            cartListPieces.add(point);
            Navigator.pop(context);
          });
        },
        child: Text(
          'CheckOut (' +
              FormatCurrency.convertToIdr((point * price), 0).toString() +
              ')',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ));
  }
}
