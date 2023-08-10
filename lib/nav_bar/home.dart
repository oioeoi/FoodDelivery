import 'package:app1_flutter_training/home_bar/home_card_promo.dart';
import 'package:app1_flutter_training/home_bar/home_card_street.dart';
import 'package:app1_flutter_training/home_bar/home_search.dart';
import 'package:app1_flutter_training/home_bar/home_slide_menu.dart';
import 'package:app1_flutter_training/widget/app_bar.dart';
import 'package:flutter/material.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: MyAppBar(
            headAppBar: 'HOME',
            icon_back: IconButton(
                onPressed: () {},
                color: Colors.green[500],
                icon: Icon(
                  Icons.notifications_outlined,
                )),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Flexible(
                  // buat component yg g scrollable
                  child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  SearchMenu(),
                  SizedBox(
                    height: 20,
                  ),
                  StreetCard()
                ],
              )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  headline_menu_text('Top of Week'),
                  SizedBox(
                    height: 15,
                  ),
                  SlideMenu(),
                ],
              ),
              Flexible(
                  // buat component yg g scrollable
                  child: ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  PromoCard()
                ],
              )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  headline_menu_text('Get Promo Today'),
                  SizedBox(
                    height: 15,
                  ),
                  SlideMenu(),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Padding headline_menu_text(String H1) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Text(
        H1,
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 22.0,
        ),
      ),
    );
  }
}
