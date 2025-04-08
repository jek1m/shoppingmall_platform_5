import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FoodDetailPage extends StatefulWidget {
  final Map<String, String> food;
  final List<Map<String, dynamic>?> foods;

  const FoodDetailPage({Key? key, required this.food, required this.foods})
      : super(key: key);

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int _quantity = 1;

  int get unitPrice => int.parse(widget.food['price']!);
  int get totalPrice => unitPrice * _quantity;

  void _showConfirmDialog() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(''),
          content: Text(
            '장바구니에 ${widget.food['name']}을/를 $_quantity개 담으시겠습니까?',
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            TextButton(
              child: Text('취소'),
              onPressed: () => Navigator.of(ctx).pop(),
            ),
            TextButton(
              child: Text('확인'),
              onPressed: () {
                Navigator.of(ctx).pop();
                _showCompleteDialog();
              },
            ),
          ],
        );
      },
    );
  }

  void _showCompleteDialog() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(''),
          content: Text('장바구니에 담았습니다.', style: TextStyle(fontSize: 18)),
          actions: [
            TextButton(
              child: Text('확인'),
              onPressed: () {
                Navigator.of(ctx).pop();

                // 같은 음식을 또 담을 경우 찾아서 증가
                if (widget.foods.contains(widget.food)) {
                  int prevAmount = int.parse(widget.food['amount']!);
                  int sum = prevAmount + _quantity;
                  widget.food['amount'] = sum.toString();
                } else {
                  widget.food['amount'] = _quantity.toString();
                  widget.foods.add(widget.food);
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.food['name']!)),
        body: ListView(
          children: [
            Container(
                width: double.infinity,
                height: 350,
                child: Image.asset(widget.food['image']!, fit: BoxFit.cover)),
            SizedBox(height: 30),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text(
                  "상품 가격 : ${NumberFormat('#,###').format(int.parse(widget.food['price']!))}원",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(width: 8)
            ]),
            SizedBox(height: 20),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                width: 400,
                height: 250,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0, style: BorderStyle.solid)),
                child: Text(widget.food['description']!,
                    style: TextStyle(
                      fontSize: 18,
                    ))),
            SizedBox(height: 20),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: Colors.grey[300],
              child: Row(
                children: [
                  // 수량 조절
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      if (_quantity > 1) {
                        setState(() {
                          _quantity--;
                        });
                      }
                    },
                  ),
                  Text(
                    '$_quantity',
                    style: TextStyle(fontSize: 18),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      if (_quantity < 99) {
                        setState(() {
                          _quantity++;
                        });
                      }
                    },
                  ),
                  SizedBox(width: 16),
                  // 총 가격
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('총 가격',
                          style: TextStyle(fontSize: 14, color: Colors.black)),
                      Text(
                        '${NumberFormat('#,###').format(totalPrice)}원',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Spacer(),
                  // 구매 버튼
                  ElevatedButton(
                    child: Text('장바구니 담기'),
                    onPressed: _showConfirmDialog,
                  )
                ],
              ),
            )
          ],
        )
        // 위젯 수량설정, 총가격, 구매하기 버튼, 장바구니 담기 버튼
        );
  }
}
