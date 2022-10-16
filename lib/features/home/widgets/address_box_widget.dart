import 'package:amazon_clone/constants/variables.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class AddressBoxWidget extends StatelessWidget {
  const AddressBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          const Icon(
            Icons.location_on_outlined,
            size: 18,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 5,
              ),
              child: Text(
                "Delivery to ${user.name} - ${user.address}",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const Padding(
            padding:  EdgeInsets.only(
              left: 5,
              top: 2,
            ),
            child:  Icon(
              Icons.arrow_drop_down_outlined,
              size: 18,
            ),
          )
        ],
      ),
    );
  }
}
