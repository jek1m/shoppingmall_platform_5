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
                            return shoppingList(foods[idx]!);
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

  Card shoppingList(Map<String, dynamic> foods) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: 150,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image.asset(
                    foods['image'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                foods['name'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print('-1');
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                        width: 1, color: Colors.black),
                                  ),
                                  child: Icon(Icons.exposure_minus_1),
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Container(
                                width: 45,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border:
                                      Border.all(width: 1, color: Colors.black),
                                ),
                                child: Center(
                                  child: Text(
                                    '0',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              GestureDetector(
                                onTap: () {
                                  print('+1');
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                        width: 1, color: Colors.black),
                                  ),
                                  child: Icon(Icons.plus_one),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              print('이거 삭제혀');
                            },
                            child: Icon(Icons.cancel),
                          ),
                          Spacer(),
                          Text(
                              '₩ ${NumberFormat('#,###').format(int.parse(foods['price']))}', // 세 자리마다 콤마 추가
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: const TextStyle(
                                letterSpacing: -1,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// GestureDetector(
//                                 onTap: () {
//                                   print('이거 삭제혀');
//                                 },
//                                 child: Icon(Icons.cancel),
//                               )







// Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           child: SizedBox(
//                             width: double.infinity,
//                             child: Text(
//                               foods['name'],
//                               style: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Expanded(
//                           child: Text(
//                             '₩ ${NumberFormat('#,###').format(int.parse(foods['price']))}', // 세 자리마다 콤마 추가
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.deepOrange,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),