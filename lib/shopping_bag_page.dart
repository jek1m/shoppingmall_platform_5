import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShoppingBag extends StatefulWidget {
  List<Map<String, dynamic>> foods;

  ShoppingBag(this.foods);

  @override
  State<ShoppingBag> createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {
  int total = 0;

  /// 총 금액을 나타내는 함수
  int getTotalMoney(List<Map<String, dynamic>?> foods) {
    total = 0;

    for (var food in foods) {
      if (food!['amount'] != '0') {
        int amount = int.parse(food['amount']);
        int price = int.parse(food['price']);
        total += (amount * price);
      }
    }

    return total;
  }

  /// 장바구니에서 삭제
  void onRemove(Map<String, dynamic> food) {
    setState(() {
      widget.foods.removeWhere((item) => item == food);
    });
  }

  /// 음식의 수량 상태를 변경하는 함수
  void onChange({required Map<String, dynamic> food, required String type}) {
    int currentAmount = int.parse(food['amount']);
    setState(() {
      if (type == 'add') {
        food['amount'] = (currentAmount + 1).toString();
      } else if (type == 'subtract') {
        food['amount'] = (currentAmount - 1).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('풋풋'),
      ),
      body: ColoredBox(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: widget.foods.isEmpty
                    ? const Center(
                        child: Text(
                          '장바구니가 비어있습니다.',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )
                    : ListView.builder(
                        itemCount: widget.foods.length,
                        itemBuilder: (context, idx) {
                          return shoppingList(widget.foods[idx]);
                        }),
              )),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                    top: 12, left: 24, right: 12, bottom: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.2),
                        spreadRadius: 2,
                        blurRadius: 1,
                        offset: Offset(0, -3),
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        '₩ ${NumberFormat('#,###').format(getTotalMoney(widget.foods))}', // 세 자리마다 콤마 추가
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: const TextStyle(
                          letterSpacing: -1,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: total == 0
                            ? null
                            : () {
                                showCupertinoDialog(
                                  context: context,
                                  builder: (context) {
                                    return CupertinoAlertDialog(
                                      title: Text('구매 하시겠습니까?'),
                                      content: Text(
                                          '총 ${NumberFormat('#,###').format(total)}원 입니다.'),
                                      actions: [
                                        CupertinoDialogAction(
                                          isDefaultAction: true,
                                          onPressed: () {
                                            // 이게 있어야 팝업 창이 사라짐
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            '취소',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                        CupertinoDialogAction(
                                          isDestructiveAction: true,
                                          onPressed: () {
                                            // 일단 메인 화면으로 돌아가기
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            '확인',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          foregroundColor: WidgetStateProperty.resolveWith(
                            (states) {
                              if (states.contains(WidgetState.disabled)) {
                                return const Color.fromARGB(
                                    255, 173, 173, 173); // 비활성화 색상
                              }
                              return Color.fromRGBO(38, 22, 73, 1); // 기본 색상
                            },
                          ),
                          backgroundColor: WidgetStateProperty.resolveWith(
                            (states) {
                              if (states.contains(WidgetState.disabled)) {
                                return const Color.fromARGB(
                                    255, 197, 197, 197); // 비활성화 색상
                              }
                              return Color.fromRGBO(233, 222, 252, 1); // 기본 색상
                            },
                          ),
                        ),
                        child: Text(
                          '구매하기',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
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
  }

  Widget shoppingList(Map<String, dynamic> food) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Image.asset(
                          food['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  food['name'],
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
                                    if (food['amount'] == '0') return;
                                    onChange(food: food, type: 'subtract');
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
                                    border: Border.all(
                                        width: 1, color: Colors.black),
                                  ),
                                  child: Center(
                                    child: Text(
                                      food['amount'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    onChange(food: food, type: 'add');
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showCupertinoDialog(
                                  context: context,
                                  builder: (context) {
                                    return CupertinoAlertDialog(
                                      title: Text('삭제 하시겠습니까?'),
                                      // content: Text(''),
                                      actions: [
                                        CupertinoDialogAction(
                                          isDefaultAction: true,
                                          onPressed: () {
                                            // 이게 있어야 팝업 창이 사라짐
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            '취소',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                        CupertinoDialogAction(
                                          isDestructiveAction: true,
                                          onPressed: () {
                                            // 이게 있어야 팝업 창이 사라짐
                                            Navigator.pop(context);
                                            onRemove(food);
                                          },
                                          child: Text(
                                            '확인',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Icon(Icons.cancel),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '₩ ${NumberFormat('#,###').format(int.parse(food['price']))}', // 세 자리마다 콤마 추가
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: const TextStyle(
                letterSpacing: -1,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
