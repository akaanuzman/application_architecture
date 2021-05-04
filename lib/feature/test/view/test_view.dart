import 'package:application_architecture/core/base/view/base_view.dart';
import 'package:application_architecture/feature/test/viewmodel/test_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
        floatingActionButton: buildFloatingActionButton,
        body: _buildBody,
      );

  FloatingActionButton get buildFloatingActionButton =>
     FloatingActionButton(
        onPressed: () => _viewModel.incrementNumber(),
      );
  

  Widget get _buildBody =>
      Observer(builder: (_) => Text(_viewModel.number.toString()));
}
