import 'dart:developer';

import 'package:dio/dio.dart';
import 'dart:convert' as convert;

import 'package:flutter/material.dart';

class LiviRepository {
  LiviRepository();

  final Dio _dio = Dio();

  String baseUrl = 'https://country.io';
  final successCode = 200;

  Future<Map<String, dynamic>> getAreaCodeList(BuildContext contxt) async {
    log('met getAreaCodeList');
    try {
      Response response = await _dio.get(
          'https://gitee.com/kevinroy-lo/livi-api/raw/master/area_code.json');
      if (response.statusCode == successCode) {
        return convert.jsonDecode(response.data);
      } else {
        // ignore: use_build_context_synchronously
        return _provideLocalCity(contxt);
      }
    } catch (e) {
      return _provideLocalCity(contxt);
    }
  }

  Future<Map<String, dynamic>> _provideLocalCity(BuildContext contxt) async {
    dynamic data =
        await DefaultAssetBundle.of(contxt).loadString("data/cities.json");
    Map<String, dynamic> user = convert.jsonDecode(data);
    return Future.value(user);
  }
}
