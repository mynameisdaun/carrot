import 'dart:math';

import 'package:dio/dio.dart';
import 'package:jdu_carrot/constants/keys.dart';
import 'package:jdu_carrot/data/address_model.dart';
import 'package:jdu_carrot/utils/logger.dart';
//67312A40-B321-3130-8AD9-14E883F48D1F

class AddressService {

  void searchAddressByStr(String text) async {
    final formData = {
      'key': VWORLD_KEY,
      'request':'search',
      'type':'ADDRESS',
      'category':'ROAD',
      'query':text,
      'size':30
    };
    var response = await Dio().get('http://api.vworld.kr/req/search', queryParameters: formData)
    .catchError((e) {
      logger.e(e.message);
    });
    logger.d(response);
    AddressModel addressModel = AddressModel.fromJson(response.data['response']);
    logger.d(addressModel);
  }
}