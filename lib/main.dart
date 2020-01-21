import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:study/config/provider_manager.dart';
import 'package:study/config/router_manger.dart';
import 'package:study/config/storage_manager.dart';
import 'package:study/generated/i18n.dart';
import 'package:study/view_model/locale_model.dart';
import 'package:study/view_model/theme_model.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await StorageManager.init();

  runApp(StudyApp());
}

class StudyApp extends StatefulWidget {
  @override
  _StudyAppState createState() => _StudyAppState();
}

class _StudyAppState extends State<StudyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MultiProvider(
        providers: providers,
        child: Consumer2<ThemeModel, LocaleModel>(
          builder: (BuildContext context, ThemeModel themeModel,
              LocaleModel localeModel, Widget child) {
            return RefreshConfiguration(
              hideFooterWhenNotFull: true,
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: themeModel.themeData(),
                darkTheme: themeModel.themeData(platformDarkMode: true),
                locale: localeModel.locale,
                localizationsDelegates: const [
                  S.delegate,
                  //下拉刷新
                  RefreshLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate
                ],
                supportedLocales: S.delegate.supportedLocales,
                onGenerateRoute: Router.generateRoute,
                initialRoute: RouteName.splash,
              ),
            );
          },
        ),
      ),
    );
  }
}
