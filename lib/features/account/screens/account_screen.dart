import 'package:amazon_clone/constants/variables.dart';
import 'package:amazon_clone/features/account/widgets/orders_widget.dart';

import "package:flutter/material.dart";

import '../widgets/item_filters_widget.dart';
import '../widgets/user_welcome_widget.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/amazon.png',
                  width: 100,
                  height: 35,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.notifications,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 15),
                child: Icon(
                  Icons.search,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: const [
          UserWelcomeWidget(),
          SizedBox(
            height: 10,
          ),
          ItemFiltersWidget(),
          SizedBox(
            height: 20,
          ),
          OrdersWidget(),
        ],
      ),
    );
  }
}
