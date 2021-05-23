import 'package:flutter/material.dart';

import '../../../core/base/view/base_view.dart';
import '../viewmodel/login_view_model.dart';

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
