import 'package:application_architecture/core/base/view/base_view.dart';
import 'package:application_architecture/feature/login/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, LoginViewModel value) => Scaffold(),
    );
  }
}
