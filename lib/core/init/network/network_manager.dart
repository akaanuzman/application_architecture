import 'dart:io';

import 'package:dio/dio.dart';

import '../../base/model/base_error.dart';
import '../../base/model/base_model.dart';
import '../../constants/enum/locale_keys_enum.dart';
import '../cache/locale_manager.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance {
    if (_instance != null)
      return _instance!;
    else {
      _instance = NetworkManager.init();
      return _instance!;
    }
  }

  NetworkManager.init(){
    final baseOptions = BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com/",
      headers: {
        "val": LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)
      }
    );
    _dio = Dio(baseOptions);

    _dio.interceptors.add(InterceptorsWrapper(
      onError: (e,handler) {
         print(BaseError(e.message));
      },
      onRequest: (options, handler) {
        options.path += "post";
      },
      onResponse: (e, handler) {
        return e.data;
      }, 
    ));
  }

  late Dio _dio;

  Future dioGet<T extends BaseModel>(String path,T model) async {
    final response = await _dio.get(path);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = response.data;

        if(responseBody is List){
          return responseBody.map((e) => model.fromJson(e));
        }else if(responseBody is Map){
          return model.toJson();
        }
        return responseBody;
      default:
    }
  }
}
