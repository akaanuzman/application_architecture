import 'package:application_architecture/core/init/cache/locale_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/app/app_constants.dart';
import 'core/init/lang/language_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/notifier/provider_list.dart';
import 'core/init/notifier/theme_notifier.dart';
import 'feature/test/view/test_view.dart';

void main() {
  LocaleManager.preferencesInit();
  runApp(
    EasyLocalization(
        child: MultiProvider(
            providers: [...ApplicationProvider.instance.dependItems],
            child: MyApp()),
        supportedLocales: LanguageManager.instance.supportedLocales,
        path: ApplicationConstants.LANG_ASSET_PATH),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      theme: Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
      home: TestView(),
    );
  }
}
