import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/base/viewmodel/base_view_model.dart';
import '../../../core/constants/enum/app_theme_enum.dart';
import '../../../core/init/network/network_manager.dart';
import '../../../core/init/notifier/theme_notifier.dart';
import '../model/test_model.dart';

part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store,BaseViewModel {

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init(){}

  @observable
  int number = 0;

  @observable
  bool isLoading = false;

  @computed
  bool get isEven => number % 2 == 0;

  @action
  void incrementNumber() {
    number++;
  }

  void changeTheme() {
    Provider.of<ThemeNotifier>(context!, listen: false)
        .changeValue(ApplicationThemeEnum.DARK);
  }

  @action
  Future<void> getSampleRequest() async {
    isLoading = true;
    final testModelList =
        await NetworkManager.instance.dioGet<TestModel>("path", TestModel());
    if (testModelList is List) {
      print(true);
    }
    isLoading = false;
  }
}
