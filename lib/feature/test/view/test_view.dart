import 'package:application_architecture/core/constants/enum/locale_keys_enum.dart';
import 'package:application_architecture/core/init/cache/locale_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/extension/string_extension.dart';
import '../../../core/init/lang/language_manager.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/test_view_model.dart';

class TestView extends StatefulWidget {
  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  late TestViewModel _viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      viewModel: _viewModel,
      onModelReady: (model) => _viewModel = model,
      onPageBuilder: (context, value) => _buildScaffold,
    );
  }

  Widget get _buildScaffold => Scaffold(
        appBar: AppBar(
          leading: Text(
              LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)),
          title: buildAppBarTitle,
          actions: [
            buildIconButtonChangeTheme,
          ],
        ),
        floatingActionButton: buildFloatingActionButton,
        body: _buildBody,
      );

  Text get buildAppBarTitle => Text(LocaleKeys.Welcome.locale);

  IconButton get buildIconButtonChangeTheme => IconButton(
        onPressed: () {
          context.setLocale(LanguageManager.instance.enLocale);
        },
        icon: Icon(Icons.change_history),
      );

  FloatingActionButton get buildFloatingActionButton => FloatingActionButton(
        onPressed: () => _viewModel.incrementNumber(),
      );

  Widget get _buildBody =>
      Observer(builder: (_) => Text(_viewModel.number.toString()));
}
