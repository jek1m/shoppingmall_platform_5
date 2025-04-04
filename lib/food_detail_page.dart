import 'package:flutter/material.dart';

class FoodDetailPage extends StatelessWidget {
  final Map<String, String> food;

  const FoodDetailPage({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(food['name']!)),

    );
  }
}