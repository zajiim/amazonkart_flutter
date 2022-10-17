import 'dart:io';

import 'package:amazon_clone/common/widgets/homepage_button.dart';
import 'package:amazon_clone/common/widgets/homepage_textfield.dart';
import 'package:amazon_clone/constants/utils.dart';

import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import "package:flutter/material.dart";

import '../../../constants/variables.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productDescriptionController =
      TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController productQuantityController =
      TextEditingController();
  final AdminServices adminServices = AdminServices();
  String category = "Mobiles";
  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    productDescriptionController.dispose();
    productPriceController.dispose();
    productQuantityController.dispose();
  }

  List<File> images = [];
  final _addProductFormKey = GlobalKey<FormState>();
  List<String> productCategories = [
    "Mobiles",
    "Essentials",
    "Appliances",
    "Books",
    "Fashion",
    "Electronics",
  ];

  void selectImages() async {
    List<File> res = await pickImages();
    setState(() {
      images = res;
    });
  }

  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() || images.isNotEmpty) {
      adminServices.sellProducts(
        context: context,
        name: productNameController.text,
        description: productDescriptionController.text,
        price: double.parse(productPriceController.text),
        quantity: double.parse(productQuantityController.text),
        category: category,
        images: images,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text(
            "Add Products",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Form(
              key: _addProductFormKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    images.isNotEmpty
                        ? CarouselSlider(
                            items: images.map((items) {
                              return Builder(
                                  builder: (context) => Image.file(
                                        items,
                                        fit: BoxFit.cover,
                                        height: 200,
                                      ));
                            }).toList(),
                            options: CarouselOptions(
                              viewportFraction: 1,
                              height: 200,
                            ),
                          )
                        : GestureDetector(
                            onTap: selectImages,
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              strokeWidth: 2,
                              dashPattern: const [15, 6],
                              radius: const Radius.circular(15),
                              child: Container(
                                width: double.infinity,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.folder_open_outlined,
                                      size: 40,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Add product Images",
                                      style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 15,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                    const SizedBox(
                      height: 30,
                    ),
                    HomepageTextfield(
                      controller: productNameController,
                      hintText: "Product Name",
                      isObscure: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    HomepageTextfield(
                      controller: productDescriptionController,
                      hintText: "Product Description",
                      isObscure: false,
                      maxLines: 8,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    HomepageTextfield(
                      controller: productPriceController,
                      hintText: "Product Price",
                      isObscure: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    HomepageTextfield(
                      controller: productQuantityController,
                      hintText: "Product Quantity",
                      isObscure: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: DropdownButton(
                        value: category,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                        ),
                        items: productCategories.map((items) {
                          return DropdownMenuItem(
                              value: items, child: Text(items));
                        }).toList(),
                        onChanged: (String? newVal) {
                          setState(() {
                            category = newVal!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    HomepageButton(text: "Sell", onTap: sellProduct),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
