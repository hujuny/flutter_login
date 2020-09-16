import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_login/utils/api.dart';

class DioUtils {
  static get(bodyParams,
      {@required String url,
      @required Function onSuccess,
      @required Function onError}) async {
    Dio dio = Dio();
    //配置dio实例
    dio.options.baseUrl = API.Base_Url;
    dio.options.connectTimeout = 5000;
    dio.options.responseType = ResponseType.json;
    dio.options.receiveTimeout = 3000;
    dio.options.headers = {
      'Accept': 'application/json,*/*',
      'Content-Type': 'application/json; charset=UTF-8',
    };
    Response response = await dio.get(
      url,
      queryParameters: bodyParams,
    );
    if (response.statusCode == 200) {
      onSuccess(response.data);
    } else {
      onError(response.data);
    }
  }

  static post(bodyParams,
      {@required String url,
      @required Function onSuccess,
      @required Function onError}) async {
    Dio dio = Dio();
    //配置dio实例
    dio.options.baseUrl = API.Base_Url;
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;
    dio.options.headers = {
      "content-type": "application/json",
    };
    Response response = await dio.post(
      url,
      queryParameters: bodyParams,
    );
    if (response.statusCode == 200) {
      onSuccess(response.data);
    } else {
      onError(response.data);
    }
  }
}
