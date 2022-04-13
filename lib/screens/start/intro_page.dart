import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '다우니 마켓',
              style: TextStyle(fontSize: 22, color: Colors.red, fontWeight: FontWeight.bold),
            ),
            ExtendedImage.asset('assets/imgs/carrot_intro.png'),
            Text('우리 동네 중고 직거래 다우니마켓',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('다우니마켓은 동네 직거래 마켓이예요.\n'
                 '내 동네를 설정하고 시작해보세요',
                style: TextStyle(fontSize: 16),),
            TextButton(
                onPressed: (){},
                child: Text('우리 동네 설정하고 시작하기',  style: TextStyle(color: Colors.white)),
                style: TextButton.styleFrom(backgroundColor: Colors.blue)
            )
          ],
        ),
      ),
    );
  }
}
