import 'package:flutter/material.dart';

class AddFoodPage extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('맛있어서 또 5조'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 상품 이름
            Row(
              children: [
                const Text(
                  '상품 이름: ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // 상품 가격
            Row(
              children: [
                const Text(
                  '상품 가격: ',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: priceController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number, // 숫자 키보드
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  '원', // "원" 텍스트 추가
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // 상품 설명
            const Text(
              '상품 설명: ',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 10),

            // 상품 설명 입력 필드 (크기 확대)
            SizedBox(
              height: 200, // 고정된 높이 설정
              child: TextField(
                controller: descController,

                maxLines: null, // 여러 줄 입력 가능
                expands: true, // 남은 공간을 모두 차지하도록 설정 (높이와 함께 사용)
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // Spacer를 사용하여 버튼을 화면 하단으로 밀기
            const Spacer(),

            // 등록하기 버튼
            SizedBox(
              width: double.infinity, // 버튼을 화면 너비만큼 채우기
              child: ElevatedButton(
                onPressed: () {
// {
//       'name': '피자',
//       'description': '치즈크러스트 기본 탑재 피자예요',
//       'image': 'assets/pizza.jpg',
//       'price': '12000'
//     },
// TODO 뒤로가기 하면서 위와같은 형식의 맵을 리턴
                  final result = {
                    'name': titleController.text,
                    'description': descController.text,
                    'image': 'assets/ricesoup.png',
                    'price': priceController.text
                  };
                  
                  // 버튼 클릭 시 동작 추가 가능
                  
                  Navigator.pop(context,result);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16), // 버튼 높이 설정
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: const Text('등록하기'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
