import 'package:flutter/material.dart';

class CustomPlusMinus extends StatefulWidget {
  const CustomPlusMinus({required this.size, this.cartPoint = 0});
  final double size;
  final int cartPoint;

  @override
  State<CustomPlusMinus> createState() => _CustomPlusMinusState();
}

class _CustomPlusMinusState extends State<CustomPlusMinus> {
  double size = 20;
  int point = 1;
  int cartPoint = 1;

  @override
  void initState() {
    super.initState();
    size = widget.size;
    cartPoint = widget.cartPoint;
  }

  @override
  Widget build(BuildContext context) {
    return plusMinusState();
  }

  Container plusMinusState() {
    return Container(
      padding: EdgeInsets.all(6),
      width: 6 * size,
      height: 2 * size,
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(50)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        GestureDetector(
          onTap: () {
            setState(() {
              (point > 1) ? point-- : 0;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
            ),
            child: Center(
              child: Icon(
                Icons.remove_outlined,
                size: 1.4 * size,
                color: Colors.grey[500],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            cartPoint.toString(),
            style: TextStyle(fontSize: size, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green[600],
          ),
          child: GestureDetector(
            onTap: () {
              setState(() {
                point++;
              });
            },
            child: Center(
              child: Icon(
                Icons.add,
                size: 1.4 * size,
                color: Colors.white,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
