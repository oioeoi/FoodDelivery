import 'package:app1_flutter_training/home_bar/home_search.dart';
import 'package:flutter/material.dart';
import '../directory_file/dot_indicator_custom.dart';
import '../menu_page/menu_page_1.dart';
import '../menu_page/menu_page_2.dart';
import '../menu_page/menu_page_3.dart';
import '../menu_page/menu_page_4.dart';
import '../widget/app_bar.dart';

class UserMenu extends StatefulWidget {
  UserMenu({super.key});

  @override
  State<UserMenu> createState() => _UserMenuState();
}

class _UserMenuState extends State<UserMenu> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: MyAppBar(
              headAppBar: 'MENU',
            ),
          ),
          body: Column(
            children: [
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.08,//atur ukuran tabbar
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Our Food',
                        style: TextStyle(
                          fontSize: 19.0,
                          color: Colors.green[500],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Special For You',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.green[500],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SearchMenu(),
              Column(
                children: [
                  Container(
                    height: 60,
                    child: DefaultTabController(
                      length: 4,
                      child: TabBar(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          labelPadding: EdgeInsets.symmetric(horizontal: 10),
                          controller: _tabController,
                          indicator: DotIndicator(
                              color: Colors.grey.shade400, radius: 4),
                          indicatorPadding: EdgeInsets.only(top: 40),
                          labelColor: Colors.green,
                          labelStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w800),
                          unselectedLabelColor: Colors.green[100],
                          unselectedLabelStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                          tabs: [
                            Tab(
                              child: Text(
                                "POPULAR",
                              ),
                            ),
                            Tab(
                              child: Text(
                                "FOOD",
                              ),
                            ),
                            Tab(
                              child: Text(
                                "DRINK",
                              ),
                            ),
                            Tab(
                              child: Text(
                                "SNACK",
                              ),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(controller: _tabController, children: [
                  MenuPage_popular(),
                  MenuPage_Food(),
                  MenuPage_Drink(),
                  MenuPage_Snack()
                ]),
              ),
            ],
          )),
    );
  }
}
