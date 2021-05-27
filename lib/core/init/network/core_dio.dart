import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import '../../base/model/base_error.dart';
import '../../base/model/base_model.dart';
import '../../constants/enum/http_request_enum.dart';
import '../../extension/network_extension.dart';
import 'ICoreDio.dart';
import 'IResponseModel.dart';

part './network_core/core_operations.dart';

class CoreDio with DioMixin implements Dio, ICoreDio {
  final BaseOptions baseOptions;

  CoreDio(this.baseOptions) {
    this.options = options;
    this.interceptors.add(InterceptorsWrapper());

    this.httpClientAdapter = DefaultHttpClientAdapter();
  }

  @override
  Future<IResponseModel<R>> coreFetch<R, T extends BaseModel>(String path,
      {required HttpTypes type,
      required T parseModel,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      void Function(int, int)? onRecieveProgress}) async {
    final response = await request(path,
        data: data, options: Options(method: type.rawValue));
    switch (response.statusCode) {
      case HttpStatus.ok:
        final model = _responseParser<R>(parseModel, data);
        return ResponseModel<R>(data: model);
      default:
        return ResponseModel(error: BaseError("message"));
    }
  }
}
