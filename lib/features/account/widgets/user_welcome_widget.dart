import 'package:amazon_clone/providers/user_provider.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import '../../../constants/variables.dart';

class UserWelcomeWidget extends StatelessWidget {
  const UserWelcomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      decoration: const BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 10,
      ),
      child: Row(
        children: [
          const Text(
            "Hello, ",
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
            ),
          ),
          Text(
            user.name,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
