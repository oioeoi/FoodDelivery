import 'package:flutter/material.dart';
import '../directory_file/format_currency.dart';

class CheckboxButton extends StatefulWidget {
  CheckboxButton({
    super.key,
    required this.doSomething,
    required this.topping,
    this.price = 1000,
  });
  final Function doSomething;
  final String topping;
  final int price;

  @override
  State<CheckboxButton> createState() => _CheckboxButtonState();
}

class _CheckboxButtonState extends State<CheckboxButton> {
  bool _isChekced = false;
  bool? newValue;
  String topping = '';
  Function doSomething = () {};
  int price = 0;

  @override
  void initState() {
    super.initState();
    doSomething = widget.doSomething;
    topping = widget.topping;
    price = widget.price;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile.adaptive(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            topping,
            style: TextStyle(
              color: Colors.green,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              FormatCurrency.convertToIdr(price, 0),
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
      value: _isChekced,
      onChanged: (newValue) {
        setState(() {
          _isChekced = newValue!;
          if (_isChekced == true) {
            doSomething;
          }
        });
      },
      activeColor: Colors.green,
      checkColor: Colors.white,
      controlAffinity:
          ListTileControlAffinity.leading, // untuk merubah tempat ched-klist
      tristate: false, //3 state
    );
  }
}
