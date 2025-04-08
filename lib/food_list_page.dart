import 'package:flutter/material.dart';
import 'package:shoppingmall_5/shopping_bag_page.dart';
import 'add_food_page.dart';
import 'food_detail_page.dart';
import 'package:intl/intl.dart';

class FoodListPage extends StatefulWidget {
  const FoodListPage({super.key});

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  List<Map<String, String>> foods = [
    // 음식 리스트
    {
      'name': '피자',
      'description': '치즈크러스트 기본 탑재 피자예요',
      'image': 'assets/pizza.jpg',
      'price': '12000'
    },
    {
      'name': '햄버거',
      'description': '맛있는 햄버거예요',
      'image': 'assets/hamburger.jpg',
      'price': '8000'
    },
  ];

  // 상세페이지, 장바구니 페이지를 위해 만든 변수
  List<Map<String, dynamic>> cartList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('풋풋'),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ShoppingBag(cartList);
                  }));
                },
                child: Icon(
                  Icons.add_shopping_cart,
                  size: 34,
                  color: Color.fromRGBO(38, 22, 73, 1),
                )),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: foods.isEmpty // foods 리스트가 비었다면 상품이 없습니다. 라는 문구가 나오게 예외처리
                ? const Center(
                    child: Text(
                      '상품이 없습니다.',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )
                : ListView.builder(
                    // listview 사용
                    itemCount: foods.length,
                    itemBuilder: (context, index) {
                      final food = foods[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FoodDetailPage(
                                food: food,
                                foods: cartList,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
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
                                    food['image']!,
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        food['name']!,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        food['description']!,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        '₩ ${NumberFormat('#,###').format(int.parse(food['price']!))}', // 세 자리마다 콤마 추가
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
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newFood = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddFoodPage()),
          );

          if (newFood != null && newFood is Map<String, String>) {
            setState(() {
              foods.add(newFood);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
