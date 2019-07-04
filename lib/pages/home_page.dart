import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../config/httpHeaders.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController typeController = new TextEditingController();
  String showText = '欢迎来到美好人间';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('美好人间'),
        ),
        body: Container(
          height: 1000,
          child: Column(
            children: <Widget>[
              TextField(
                controller: typeController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  labelText: '类型',
                  hintText: '请输入',
                ),
                autofocus: false,
              ),
              RaisedButton(
                onPressed: _choiceAction,
                child: Text('开始发车'),
              ),
              Text(
                showText,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _choiceAction() {
    print('开始选择你喜欢的类型............');
    if (typeController.text.toString() == '') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('请输入'),
            ),
      );
    } else {
      getHttp(typeController.text.toString()).then((val) {
        print(val);
        setState(() {
          showText = val.data;
        });
      });
    }
  }

  Future getHttp(String TypeText) async {
    try {
      Response response;
      var data = {'name': TypeText};
      Dio dio = new Dio();
      dio.options.headers = httpHeaders;
      response = await dio.post(
        'https://time.geekbang.org/serv/v1/column/newAll',
        // queryParameters: data,
      );
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
}
