import "package:flutter/material.dart";

class DealOfTheDayWidget extends StatefulWidget {
  const DealOfTheDayWidget({super.key});

  @override
  State<DealOfTheDayWidget> createState() => _DealOfTheDayWidgetState();
}

class _DealOfTheDayWidgetState extends State<DealOfTheDayWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 15, left: 10),
          alignment: Alignment.topLeft,
          child: const Text(
            "Deal of the day",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Image.network(
          "https://www.aptronixindia.com/media/catalog/product/m/b/mbp14-spacegray-select-202110_1_1.jpeg",
          height: 235,
          fit: BoxFit.fitHeight,
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          alignment: Alignment.topLeft,
          child: const Text(
            "₹ 89000",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 10,
            top: 15,
            right: 40,
          ),
          alignment: Alignment.topLeft,
          child: const Text(
            "Macbook Pro m2",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                "https://www.digitaltrends.com/wp-content/uploads/2022/09/asus-vivobook-s-14-plus-featured-e1664308618423.jpg?p=1",
                fit: BoxFit.contain,
                width: 100,
                height: 100,
              ),
              Image.network(
                "https://d2d22nphq0yz8t.cloudfront.net/88e6cc4b-eaa1-4053-af65-563d88ba8b26/https://media.croma.com/image/upload/v1662703105/Croma%20Assets/Communication/Mobiles/Images/261963_oqrd6j.png/mxw_640,f_auto",
                fit: BoxFit.contain,
                width: 100,
                height: 100,
              ),
              Image.network(
                "https://www.91-img.com/pictures/149292-v4-google-pixel-7-pro-5g-mobile-phone-large-1.jpg",
                fit: BoxFit.contain,
                width: 100,
                height: 100,
              ),
              Image.network(
                "https://d2d22nphq0yz8t.cloudfront.net/88e6cc4b-eaa1-4053-af65-563d88ba8b26/https://media.croma.com/image/upload/v1662703105/Croma%20Assets/Communication/Mobiles/Images/261963_oqrd6j.png/mxw_640,f_auto",
                fit: BoxFit.contain,
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 15,
            left: 15,
          ),
          alignment: Alignment.topLeft,
          child: Text(
            "See all deals",
            style: TextStyle(
              color: Colors.cyan[800],
            ),
          ),
        ),
      ],
    );
  }
}
