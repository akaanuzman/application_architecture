import 'package:flutter/cupertino.dart';

import '../../init/network/ICoreDio.dart';

abstract class BaseViewModel {
  BuildContext? context;

  ICoreDio? coreDio;

  void setContext(BuildContext context);
  void init();
}
