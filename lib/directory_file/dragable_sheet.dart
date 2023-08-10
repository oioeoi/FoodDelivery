import 'package:app1_flutter_training/directory_file/bottom_checkout.dart';
import 'package:app1_flutter_training/directory_file/dataApp.dart';
import 'package:flutter/material.dart';
import 'capitalize_each_word.dart';
import 'format_currency.dart';

class MyDragableSheet extends StatefulWidget {
  MyDragableSheet(
      {required this.imageUrl, required this.menu, required this.price});
  final imageUrl;
  final menu;
  final price;

  @override
  State<MyDragableSheet> createState() => _MyDragableSheetState();
}

class _MyDragableSheetState extends State<MyDragableSheet> {
  int index = 1;
  int calculation = 0;
  int point = 1;
  bool? _isChekced = false;
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
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.1,
      maxChildSize: 1,
      expand: false,
      snap: true,
      controller: DraggableScrollableController(),
      builder: (context, scrollController) {
        return Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
          child: Column(
            // tata letak widget
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 5),
              Center(
                //garis abu2 diatas
                child: Container(
                  width: 60,
                  height: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[300],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Flexible(
                  //headline banner
                  child: ListView(
                children: [
                  Column(
                    // head dan subhead
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 1,
                              height: MediaQuery.of(context).size.height * 0.28,
                              child: Image.network(
                                imageUrl,
                                fit: BoxFit.cover,
                              ),
                            )),
                      ),
                      SizedBox(height: 18),
                      Text(
                        capitalizeEachWord(menu),
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w800,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        FormatCurrency.convertToIdr(price, 0).toString(),
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w500,
                          fontSize: 19,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          plusMinusState(
                            20.0,
                            listPrice[index],
                          ),
                          Text(
                              FormatCurrency.convertToIdr((point * price), 0)
                                  .toString(),
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                                color: Colors.green[600],
                              ))
                        ],
                      ),
                      SizedBox(height: 20),
                      Center(
                        //garis pembatas
                        child: Container(
                          width: double.infinity,
                          height: 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[200],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text('Sambal',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                        border:
                            Border.all(width: 1, color: Colors.grey.shade300)),
                    child: Column(
                      children: [
                        CheckboxListTile.adaptive(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ini titlenya',
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text(
                                  FormatCurrency.convertToIdr(2000, 0),
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          value: _isChekced,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _isChekced = newValue;
                            });
                          },

                          activeColor: Colors.green,
                          checkColor: Colors.white,
                          controlAffinity: ListTileControlAffinity
                              .leading, // untuk merubah tempat ched-klist
                          tristate: false, //3 state
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey[300],
                        ),
                        CheckboxListTile.adaptive(
                          title: Text('ini titlenya'),
                          value: _isChekced,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _isChekced = newValue;
                            });
                          },
                          activeColor: Colors.green,
                          checkColor: Colors.white,
                          controlAffinity: ListTileControlAffinity
                              .leading, // untuk merubah tempat ched-klist
                          tristate: false, //3 state
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Pelengkap',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                        border:
                            Border.all(width: 1, color: Colors.grey.shade300)),
                    child: Column(
                      children: [
                        CheckboxListTile.adaptive(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ini titlenya',
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text(
                                  FormatCurrency.convertToIdr(2000, 0),
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          value: _isChekced,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _isChekced = newValue;
                            });
                          },
                          activeColor: Colors.green,
                          checkColor: Colors.white,
                          controlAffinity: ListTileControlAffinity
                              .leading, // untuk merubah tempat ched-klist
                          tristate: false, //3 state
                        ),
                        Container(
                          height: 2,
                          color: Colors.grey[300],
                        ),
                        CheckboxListTile.adaptive(
                          title: Text('ini titlenya'),
                          value: _isChekced,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _isChekced = newValue;
                            });
                          },
                          activeColor: Colors.green,
                          checkColor: Colors.white,
                          controlAffinity: ListTileControlAffinity
                              .leading, // untuk merubah tempat ched-klist
                          tristate: false, //3 state
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              Padding(
                //checkout button
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: MyBottomCheckOut(
                    imageUrl: imageUrl, menu: menu, price: price),
              ),
            ],
          ),
        );
      },
    );
  }

  Container plusMinusState(double size, int calculation) {
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
                size: 1.3 * size,
                color: Colors.grey[500],
              ),
            ),
          ),
        ),
        Padding(
          //jumlah angka
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            point.toString(),
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
              //plus state
              setState(() {
                point++;
              });
            },
            child: Center(
              child: Icon(
                Icons.add,
                size: 1.3 * size,
                color: Colors.white,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
