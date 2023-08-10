import 'package:app1_flutter_training/cart_page_1.dart';
import 'package:app1_flutter_training/widget/app_bar.dart';
import 'package:flutter/material.dart';

class UserCart extends StatefulWidget {
  const UserCart({super.key});

  @override
  State<UserCart> createState() => _UserCartState();
}

class _UserCartState extends State<UserCart> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: MyAppBar(
                headAppBar: 'CART',
                color: Colors.green[500],
              ),
            ),
            body: Container(
              color: Colors.white,
              child: Column(children: [
                TabBar(
                    controller: _tabController,
                    indicatorWeight: 4,
                    indicatorColor: Colors.green,
                    labelColor: Colors.green,
                    labelStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                    unselectedLabelColor: Colors.green[200],
                    unselectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.5,
                    ),
                    tabs: [
                      Tab(
                        child: Text(
                          'Order',
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Payment',
                        ),
                      ),
                    ]),
                Expanded(
                  child: DefaultTabController(
                      length: 2,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          Expanded(
                            child: TabBarView(
                                controller: _tabController,
                                children: [
                                  Tab(child: MyOrderPage()),
                                  Tab(
                                    child: Container(
                                      color: Colors.green,
                                    ),
                                  )
                                ]),
                          )
                        ],
                      )),
                ),
              ]),
            )));
  }
}
