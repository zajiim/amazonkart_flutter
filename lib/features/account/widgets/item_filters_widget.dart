import 'package:amazon_clone/features/account/widgets/custom_button.dart';
import "package:flutter/material.dart";

class ItemFiltersWidget extends StatefulWidget {
  const ItemFiltersWidget({super.key});

  @override
  State<ItemFiltersWidget> createState() => _ItemFiltersWidgetState();
}

class _ItemFiltersWidgetState extends State<ItemFiltersWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomButton(text: "Your Orders", onPressed: () {}),
            CustomButton(text: "Turn Seller", onPressed: () {}),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            CustomButton(text: "Log Out", onPressed: () {}),
            CustomButton(text: "Your Wish List", onPressed: () {}),
          ],
        )
      ],
    );
  }
}
