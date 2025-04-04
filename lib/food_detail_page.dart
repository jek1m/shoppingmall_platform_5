import 'package:flutter/material.dart';

class FoodDetailPage extends StatelessWidget {
  final Map<String, String> food;

  const FoodDetailPage({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(food['name']!)),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 350,
            child: Image.asset(food['image']!,
            fit: BoxFit.cover)),
            SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("상품 가격 : ${food['price']!}원",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              )
              ),
              SizedBox(width: 8)
            ]
          ),
              Text(food['description']!),
              // 위젯 수량설정, 총가격, 구매하기 버튼, 장바구니 담기 버튼
          ],
      ),

    );
  }
}