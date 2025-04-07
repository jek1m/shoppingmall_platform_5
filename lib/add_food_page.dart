import 'package:flutter/material.dart';

class AddFoodPage extends StatefulWidget {
  @override
  State<AddFoodPage> createState() => _AddFoodPageState();
}

class _AddFoodPageState extends State<AddFoodPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  // 이미지 선택 여부를 확인하기 위한 변수
  bool isImageSelected = false;

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
            // 이미지 선택 컨테이너
            GestureDetector(
              onTap: () {
                // 탭 했을 때 텍스트 변경
                setState(() {
                  isImageSelected = true;
                });

                // TODO: 이미지 선택 기능 구현 예정
              },
              child: // 이미지 선택 컨테이너
                  // 이미지 선택 컨테이너
                  GestureDetector(
                onTap: () {
                  // SnackBar로 메시지 띄우기
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('이미지를 선택했습니다'),
                      duration: Duration(seconds: 2), // 2초간 표시
                    ),
                  );
                },
                child: Container(
                  height: 180, // 크기 설정
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300], // 회색 배경
                    borderRadius: BorderRadius.circular(8), // 모서리 둥글게
                  ),
                  child: const Center(
                    child: Text(
                      '이미지 선택',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16), // 이미지 선택 컨테이너와 상품 이름 사이 간격

            // 상품 이름
            Row(
              children: [
                const Text(
                  '상품 이름: ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true, // 세로 padding 줄이기
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),

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
                      isDense: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 12),
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
            const SizedBox(height: 6),

            // 상품 설명
            const Text(
              '상품 설명: ',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 6),

            // 상품 설명 입력 필드 (크기 축소)
            SizedBox(
              height: 120, // 높이 축소
              child: TextField(
                controller: descController,
                maxLines: null, // 여러 줄 입력 가능
                expands: true, // 남은 공간을 모두 차지하도록 설정 (높이와 함께 사용)
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 12),
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
                  //현재 값이 없어도 버튼이 눌림.
                  //입력 필수 값 검사: 텍스트가 하나라도 비어있으면 스낵바를 활용해 텍스트 출력함.
                  if (titleController.text.isEmpty ||
                      descController.text.isEmpty ||
                      priceController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('모든 항목을 입력해주세요'),
                      ),
                    );
                    return;
                  }
                  final result = {
                    'name': titleController.text,
                    'description': descController.text,
                    'image': 'assets/ricesoup.png',
                    'price': priceController.text
                  };

                  Navigator.pop(context, result); //데이터 전달
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16), // 버튼 높이 설정
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // 버튼 모서리를 직각으로 설정 (옵션)
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
