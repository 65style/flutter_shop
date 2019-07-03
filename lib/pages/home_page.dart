import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getHttp();
    return Scaffold(
        body: Center(
      child: Text('商城首页d'),
    ));
  }

  void getHttp() async {
    try {
      Response response = await Dio().get("http://www.google.com");
      print('11222');
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
