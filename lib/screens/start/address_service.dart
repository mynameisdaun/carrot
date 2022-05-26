import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jdu_carrot/constants/keys.dart';
import 'package:jdu_carrot/data/address_model.dart';
import 'package:jdu_carrot/data/address_model2.dart';
import 'package:jdu_carrot/utils/logger.dart';
//67312A40-B321-3130-8AD9-14E883F48D1F

class AddressService {
  Future<AddressModel> searchAddressByStr(String text) async {
    final formData = {
      'key': VWORLD_KEY,
      'request': 'search',
      'type': 'ADDRESS',
      'category': 'ROAD',
      'query': text,
      'size': 30
    };
    var response = await Dio()
        .get('http://api.vworld.kr/req/search', queryParameters: formData)
        .catchError((e) {
      logger.e(e.message);
    });
    return AddressModel.fromJson(response.data['response']);
  }

  Future<List<AddressModel2>> findAddressByCoordinate(
      {required double log, required double lat}) async {
    final List<double> dx = [0, -0.01, 0, 0.01, 0];
    final List<double> dy = [0, 0, -0.01, 0, 0.01];
    final List<AddressModel2> addresses = <AddressModel2>[];

    for (int i = 0; i < 5; i++) {
      final formData = {
        'key': VWORLD_KEY,
        'service': 'address',
        'request': 'getAddress',
        'type': 'PARCEL',
        'point': '${log + dx[i]},${lat + dy[i]}',
      };
      var response = await Dio()
          .get('http://api.vworld.kr/req/address', queryParameters: formData)
          .catchError((e) {
        logger.e(e.message);
      });
      AddressModel2 addressModel =
          AddressModel2.fromJson(response.data["response"]);
      if (response.data['response']['status'] == 'OK') {
        addresses.add(addressModel);
      }
    }
    return addresses;
  }
}
