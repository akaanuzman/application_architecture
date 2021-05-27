import 'ICoreDio.dart';
import 'core_dio.dart';
import 'package:dio/dio.dart';

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

  late ICoreDio coreDio;

  NetworkManager.init() {
    final baseOptions = BaseOptions(
        baseUrl: "https://jsonplaceholder.typicode.com/",
        headers: {
          "val": LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)
        });

    coreDio = CoreDio(baseOptions);
  }
}
