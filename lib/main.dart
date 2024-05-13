import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'app/modules/utils/helpers/common_functions.dart';
import 'app/modules/utils/services/api_services.dart';
import 'app/modules/utils/services/global_storage_service.dart';
import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialConfig();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  if (kDebugMode) {
    runApp(const MyApp());
    // DependencyInjection.init();
  }
  else {
    runApp(
      const MyApp()
    );
    // DependencyInjection.init();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? widget) {
        return GetMaterialApp(
          title: "GoSmart Employe App",
          defaultTransition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 200),
          translationsKeys: AppTranslation.translations,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ja', 'JP'),
          ],
          locale: const Locale('ja', 'JP'),
          fallbackLocale: const Locale('ja', 'JP'),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: false),
        );
      },
    );
  }
}

Future<void> initialConfig() async {
  await Get.putAsync(() => GlobalStorageService().init());
  String baseUrl = await Get.putAsync(() => ApiService.init('qa'));
  setBaseURL(baseUrl);
}