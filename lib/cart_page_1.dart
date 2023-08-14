import 'package:app1_flutter_training/directory_file/capitalize_each_word.dart';
import 'package:app1_flutter_training/widget/custom_checkout.dart';
import 'package:app1_flutter_training/widget/custom_plusminus.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'directory_file/dataApp.dart';
import 'directory_file/format_currency.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({super.key});

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

enum Action { delete, share }

class _MyOrderPageState extends State<MyOrderPage> {
  int moneyMap = 0;
  String nameMap = '';
  String pointMap = '';
  List slidableList = [];

  void _showSnackBar(
    BuildContext,
    String message,
    Color color,
  ) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void slideStateAction(int index, Action action) {
    setState(() {
      var menu = cartListMenu[index];
      switch (action) {
        case Action.delete:
          cartListImage.removeAt(index);
          cartListMenu.removeAt(index);
          cartListPrice.removeAt(index); //ini num
          cartListPieces.removeAt(index); //ini num

          _showSnackBar(
            context,
            '$menu is deleted',
            Colors.red,
          );
          break;
        case Action.share:
          _showSnackBar(
            context,
            '$menu is shared',
            Colors.green,
          );
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ConditionalBuilder(
          condition: cartListMenu.isNotEmpty,
          builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 25, right: 20, left: 20, bottom: 10),
                  child: Text(
                    'Your Order (' + cartListImage.length.toString() + ')',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 22.0,
                    ),
                  ),
                ),
                Flexible(
                  child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            //garis pembatas
                            child: Container(
                              width: double.infinity,
                              height: 2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[100],
                              ),
                            ));
                      },
                      scrollDirection: Axis.vertical,
                      itemCount: cartListImage.length,
                      itemBuilder: (context, index) {
                        return SlidableWidget(index, context);
                      }),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: CustomCheckOutBotton(
                        setState: () {}, text: 'Place Order')),
              ],
            );
          },
          fallback: (context) => Center(
            child: SvgPicture.asset(
              "asset/cartisempty.svg",
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.4,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }

  Slidable SlidableWidget(int index, BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        dismissible: DismissiblePane(
          closeOnCancel: true,
          onDismissed: () {
            slideStateAction(index, Action.delete);
          },
          confirmDismiss: () async {
            bool? result = await showDialog<bool?>(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: Text('Confirm'),
                    content: Text('Menu will be deleted'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          child: Text('no')),
                      TextButton(
                          onPressed: () {
                            slideStateAction(index, Action.delete);
                            Navigator.pop(context, true);
                          },
                          child: Text('yes')),
                    ],
                  );
                });
            return result ?? false;
          },
        ),
        children: [
          SlidableAction(
            onPressed: (context) => slideStateAction(index, Action.delete),
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: card_order(index, cartListImage[index],
          capitalizeEachWord(cartListMenu[index]), cartListPrice[index]),
    );
  }

  Container card_order(int index, String strImage, String strMenu, int price) {
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
                      strMenu,
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
                      topingItem[index],
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
                          CustomPlusMinus(
                              size: 16.0, cartPoint: cartListPieces[index]),
                          Text(
                              FormatCurrency.convertToIdr(
                                      (cartListPrice[index]), 0)
                                  .toString(),
                              style: TextStyle(
                                fontSize: 18,
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
            setState(() {});
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
          //jumlah angka
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            pointMap.toString(),
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
              setState(() {});
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
