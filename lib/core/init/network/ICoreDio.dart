import '../../base/model/base_model.dart';
import '../../constants/enum/http_request_enum.dart';
import 'IResponseModel.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>>
      coreFetch<R, T extends BaseModel>(String path,
          {required HttpTypes type,
          required T parseModel,
          dynamic data,
          Map<String, dynamic> queryParameters,
          void Function(int, int) onRecieveProgress});
}
