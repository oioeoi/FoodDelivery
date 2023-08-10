import 'package:app1_flutter_training/directory_file/format_currency.dart';
import 'package:flutter/material.dart';

class MyCounting extends StatefulWidget {
  final int count;
  final double fontSize;
  const MyCounting({super.key, required this.count, this.fontSize = 18});

  @override
  State<MyCounting> createState() => _MyCountingState();
}

class _MyCountingState extends State<MyCounting> {
  double fontSize = 20;
  int count = 1;

  @override
  void initState() {
    super.initState();
    count = widget.count;
    fontSize = widget.fontSize;
  }

  @override
  Widget build(BuildContext context) {
    return Text(FormatCurrency.convertToIdr(widget.count, 0).toString(),
        style: TextStyle(
          fontSize: widget.fontSize,
          fontWeight: FontWeight.w600,
          color: Colors.green[600],
        ));
  }
}
