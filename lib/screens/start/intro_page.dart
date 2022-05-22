import 'package:dio/dio.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:jdu_carrot/constants/common_size.dart';
import 'package:jdu_carrot/states/user_provider.dart';
import 'package:jdu_carrot/utils/logger.dart';
import 'package:provider/src/provider.dart';

class IntroPage extends StatelessWidget {
  PageController controller;
  IntroPage(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    logger.d('current user state: ${context.read<UserProvider>().userState}');
    return LayoutBuilder(
      builder: (context, constraints) {
        Size size = MediaQuery.of(context).size;
        final imgSize = size.width - 32;
        final sizeOfPosImg = imgSize * 0.1;
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: common_padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '다우니 마켓',
                  style: TextStyle(
                      fontSize: 22,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: imgSize,
                  height: imgSize,
                  child: Stack(
                    children: [
                      ExtendedImage.asset('assets/imgs/carrot_intro.png'),
                      Positioned(
                          width: sizeOfPosImg,
                          left:  imgSize * 0.45,
                          top:   imgSize * 0.45,
                          height: sizeOfPosImg,
                          child: ExtendedImage.asset(
                              'assets/imgs/carrot_intro_pos.png')),
                    ],
                  ),
                ),
                Text('우리 동네 중고 거래 다우니마켓',
                    style:Theme.of(context).textTheme.headline6),
                Text(
                  '다우니마켓은 동네 직거래 마켓이예요.\n'
                  '내 동네를 설정하고 시작해보세요',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                TextButton(
                    onPressed: () async {
                      controller.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.ease);
                    },
                    child: Text('우리 동네 설정하고 시작하기',
                        style: Theme.of(context).textTheme.button),)
              ],
            ),
          ),
        );
      },
    );
  }
}
