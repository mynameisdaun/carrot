import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jdu_carrot/constants/common_size.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(left: common_padding, right: common_padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey,),
                hintText: '도로명으로 검색',
                hintStyle: TextStyle(color: Theme.of(context).hintColor),
                border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                prefixIconConstraints: BoxConstraints(minHeight: 24, minWidth: 24)
            ),
          ),
          TextButton.icon(
              onPressed: (){},
              icon:Icon(CupertinoIcons.compass, color: Colors.white, size: 20,),
              label: Text('현재 위치 찾기', style: Theme.of(context).textTheme.button,),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: common_padding),
              itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.comment),
                trailing: Icon(Icons.delete),
                title: Text('address $index'),
                subtitle: Text('subtitle $index'),
              );
            }, itemCount: 30,),
          )
        ],
      ),
    );
  }
}
