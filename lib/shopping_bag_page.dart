import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShoppingBag extends StatelessWidget {
  List<Map<String, dynamic>?> foods = [
    {
      'name': '피자',
      'description': '치즈크러스트 기본 탑재 피자예요',
      'image': 'assets/pizza.jpg',
      'price': '12000'
    },
    {
      'name': '피자',
      'description': '치즈크러스트 기본 탑재 피자예요',
      'image': 'assets/pizza.jpg',
      'price': '12000'
    },
    {
      'name': '피자',
      'description': '치즈크러스트 기본 탑재 피자예요',
      'image': 'assets/pizza.jpg',
      'price': '12000'
    },
    {
      'name': '피자',
      'description': '치즈크러스트 기본 탑재 피자예요',
      'image': 'assets/pizza.jpg',
      'price': '12000'
    },
    {
      'name': '피자',
      'description': '치즈크러스트 기본 탑재 피자예요',
      'image': 'assets/pizza.jpg',
      'price': '12000'
    },
    {
      'name': '피자',
      'description': '치즈크러스트 기본 탑재 피자예요',
      'image': 'assets/pizza.jpg',
      'price': '12000'
    },
    {
      'name': '피자',
      'description': '치즈크러스트 기본 탑재 피자예요',
      'image': 'assets/pizza.jpg',
      'price': '12000'
    },
    {
      'name': '피자',
      'description': '치즈크러스트 기본 탑재 피자예요',
      'image': 'assets/pizza.jpg',
      'price': '12000'
    },
    {
      'name': '피자',
      'description': '치즈크러스트 기본 탑재 피자예요',
      'image': 'assets/pizza.jpg',
      'price': '12000'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('맛있으면 또 5조'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Expanded(
                  child: foods.isEmpty
                      ? const Center(
                          child: Text(
                            '장바구니가 비어있습니다.',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        )
                      : ListView.builder(
                          itemCount: foods.length,
                          itemBuilder: (context, idx) {
                            return shoppingList();
                          })),
              SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        foregroundColor: WidgetStatePropertyAll(
                          Color.fromRGBO(38, 22, 73, 1),
                        ),
                        backgroundColor: WidgetStatePropertyAll(
                            Color.fromRGBO(233, 222, 252, 1)),
                      ),
                      child: Text(
                        '구매하기',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )))
            ],
          ),
        ),
      ),
    );
    ;
  }

  Card shoppingList() {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/pizza.jpg',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '피자',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '설명설명',
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '₩ ${NumberFormat('#,###').format(int.parse('16000'))}', // 세 자리마다 콤마 추가
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
