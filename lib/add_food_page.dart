import 'package:flutter/material.dart';

class AddFoodPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  AddFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('음식 추가')),
    );
  }
}
