import 'package:flutter/material.dart';

class BoxTopping extends StatefulWidget {
  const BoxTopping({super.key});

  @override
  State<BoxTopping> createState() => _BoxToppingState();
}

class _BoxToppingState extends State<BoxTopping> {
  bool? _isChekced = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        border: Border.all(
          width: 1.0,
          color: Colors.green,
        ),
      ),
      child: CheckboxListTile.adaptive(
        title: Text('ini titlenya'),
        subtitle: Text('ini subtittle'),
        value: _isChekced,
        onChanged: (bool? newValue) {
          setState(() {
            _isChekced = newValue;
          });
        },
        activeColor: Colors.green,
        checkColor: Colors.white,
        controlAffinity:
            ListTileControlAffinity.leading, // untuk merubah tempat ched-klist
        tristate: false, //3 state
      ),
    );
  }
}
