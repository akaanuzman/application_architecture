import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/base/viewmodel/base_view_model.dart';
import '../../../core/constants/enum/app_theme_enum.dart';
import '../../../core/constants/enum/http_request_enum.dart';
import '../../../core/init/network/IResponseModel.dart';
import '../../../core/init/notifier/theme_notifier.dart';
import '../model/test_model.dart';

part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {}

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
    final response =
        await coreDio?.coreFetch<ResponseModel<List<TestModel>>, TestModel>("x",
            type: HttpTypes.GET, parseModel: TestModel());
    if (response?.data is List) {
      print(true);
    } else {
      print(response?.error);
    }
    isLoading = false;
  }
}
