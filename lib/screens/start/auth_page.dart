import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:jdu_carrot/constants/common_size.dart';
import 'package:jdu_carrot/states/user_provider.dart';
import 'package:jdu_carrot/utils/logger.dart';
import 'package:provider/src/provider.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final inputBorder = OutlineInputBorder(borderSide: BorderSide(color: Colors.grey));

  TextEditingController _phoneNumberController = TextEditingController(text: "010");

  TextEditingController _codeController        = TextEditingController();

  VerificationStatus _verificationStatus = VerificationStatus.none;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Size size = MediaQuery.of(context).size;
        //ignoring true 이면 전부 무시한다
        return IgnorePointer(
          ignoring: _verificationStatus == VerificationStatus.verifying,
          child: Form(
            key: _formKey,
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  '전화번호 로그인',
                  style: Theme.of(context).appBarTheme.titleTextStyle,
                ),
              ),
              body: Padding(
                padding: EdgeInsets.all(common_padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        ExtendedImage.asset('assets/imgs/padlock.png', width: size.width*0.15, height: size.height*0.15,),
                        SizedBox(width: common_sm_padding,),
                        Text('다우니마켓은 휴대폰 번호로 가입해요.\n휴대폰은 안전하게 보관되며\n어디에도 공개되지 않아요.')
                      ],
                    ),
                    SizedBox(height: common_padding,),
                    TextFormField(
                      controller: _phoneNumberController,
                      inputFormatters: [MaskedInputFormatter("000 0000 0000")],
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        focusedBorder: inputBorder,
                        border: inputBorder
                      ),
                      validator: (phoneNumber) {
                        if(phoneNumber != null && phoneNumber.length ==13) {
                          return null;
                        }else {
                          return '올바른 전화번호를 입력해 주세요.';
                        }
                      },
                    ),
                    SizedBox(height: common_padding,),
                    TextButton(onPressed: (){
                      if(_formKey.currentState != null && _formKey.currentState!.validate()) {
                        setState(() {
                          _verificationStatus = VerificationStatus.codeSent;
                        });
                      }


                    }, child: Text('인증문자 발송')),
                    SizedBox(height: common_padding,),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 300),
                      opacity: (_verificationStatus == VerificationStatus.none ? 0 : 1),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: getVerificationHeight(_verificationStatus),
                        curve: Curves.easeInOut,
                        child: TextFormField(
                          controller: _codeController,
                          inputFormatters: [MaskedInputFormatter("0000000")],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              focusedBorder: inputBorder,
                              border: inputBorder
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: common_padding,),
                    AnimatedContainer(duration: Duration(seconds: 1),
                    height: getVerificationBtnHeight(_verificationStatus),
                    child: TextButton(
                        onPressed: (){attemptVerify(context);},
                        child: (_verificationStatus == VerificationStatus.verifying
                            ? CircularProgressIndicator(color:Colors.white)
                            : Text("확인")))
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  double getVerificationHeight(VerificationStatus status) {
    switch(status) {
      case VerificationStatus.none:
        return 0;
      case VerificationStatus.codeSent:
      case VerificationStatus.verifying:
      case VerificationStatus.verificationDone:
        return 60 + common_sm_padding;
    }
  }

  double getVerificationBtnHeight(VerificationStatus status) {
    switch(status) {
      case VerificationStatus.none:
        return 0;
      case VerificationStatus.codeSent:
      case VerificationStatus.verifying:
      case VerificationStatus.verificationDone:
        return 48;
    }
  }


  void attemptVerify(BuildContext context) async {
    setState(() {
      _verificationStatus = VerificationStatus.verifying;
    });

    await Future.delayed(Duration(seconds: 1));
   //3초동안 아무것도 못하게 막는다....
    setState(() {
      _verificationStatus = VerificationStatus.verificationDone;
    });
    context.read<UserProvider>().setUserAuth(true);


  }

}

enum VerificationStatus {
  none, codeSent, verifying, verificationDone
}
