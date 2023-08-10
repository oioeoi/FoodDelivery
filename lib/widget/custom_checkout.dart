import 'package:flutter/material.dart';

class CustomCheckOutBotton extends StatefulWidget {
  const CustomCheckOutBotton(
      {super.key, required this.setState, required this.text});
  final Function setState;
  final String text;

  @override
  State<CustomCheckOutBotton> createState() => _CustomCheckOutBottonState();
}

class _CustomCheckOutBottonState extends State<CustomCheckOutBotton> {
  Function set = () {};
  String text = '';
  @override
  void initState() {
    super.initState();
    set = widget.setState;
    text = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return checkoutOrder();
  }

  ElevatedButton checkoutOrder() {
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
          setState(() {});
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18.0,
          ),
        ));
  }
}
