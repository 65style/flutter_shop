import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';

Future getHomePageContent() async {
  try {
    print('开始获取首页数据。。。。。。。。。');
    Response response;
    Dio dio = new Dio();

    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded;charset=UTF-8");
    var formData = {'lon': '114.32923126220703', 'lat': '30.546764373779297'};
    response = await dio.post(servicePath['homePageContent'], data: formData);
    print(response);
    if (response.statusCode == 200) {
      print(1111111);
      print(response.data);
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR: =====>${e}');
  }
}
