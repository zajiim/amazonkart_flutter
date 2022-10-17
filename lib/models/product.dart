import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  final String name;
  final String description;
  final int quantity;
  final double price;
  final List<String> images;
  final String category;
  final String? id;
  
  Product({
    required this.name,
    required this.description,
    required this.quantity,
    required this.price,
    required this.images,
    required this.category,
    this.id,
   
  });
  


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'quantity': quantity,
      'price': price,
      'images': images,
      'category': category,
      'id': id,
      
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] as String,
      description: map['description'] as String,
      quantity: map['quantity'] as int,
      price: map['price'] as double,
      images: List<String>.from((map['images'] as List<String>)),
      category: map['category'] as String,
      id: map['_id'] != null ? map['id'] as String : null,
      
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
