import 'package:app1_flutter_training/directory_file/capitalize_each_word.dart';
import 'package:app1_flutter_training/directory_file/format_currency.dart';
import 'package:flutter/material.dart';

class CustomBanner extends StatelessWidget {
  CustomBanner({
    super.key,
    required this.imageUrl,
    required this.H1,
    required this.H2,
    this.widthBanner,
    this.radiusBanner,
  });
  final String H1, imageUrl;
  final double? widthBanner, radiusBanner;
  final dynamic H2;

  @override
  Widget build(BuildContext context) {
    return Container(
      //ukuran banner yg membatasi item didalamnya
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radiusBanner ?? 15),
        color: Colors.white,
      ),
      width: widthBanner ?? 130,
      child: Column(
        //item vertical banner
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // container foto
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(imageUrl), fit: BoxFit.fitWidth),
                    borderRadius: BorderRadius.circular(radiusBanner ?? 15)),
                width: double.infinity,
                height: 150,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              capitalizeEachWord(H1),
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w800,
                fontSize: 17,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              FormatCurrency.convertToIdr(H2, 0).toString(),
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
