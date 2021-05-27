import '../../init/network/IResponseModel.dart';

class BaseError extends IErrorModel {
  final String data;

  BaseError(this.data);

  @override
  void statusCode() {}
}
