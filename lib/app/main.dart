import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:growup_agro/app/routes/app_pages.dart';
import 'package:growup_agro/app/theme/theme.dart';
import 'package:growup_agro/app/utils/network_utils.dart';
import 'package:growup_agro/app/utils/utils.dart';
import 'package:growup_agro/utils/api_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shurjopay/utilities/functions.dart';

Future<void> main() async {
  var we = WidgetsFlutterBinding.ensureInitialized();

  // Configure EasyLoading
  Utils.configLoading();

  // Initialize Shurjopay
  await initializeShurjopay(environment: "live");

  // Initialize GetStorage
  await GetStorage.init();

  // Initialize NetworkUtils
  await Get.putAsync(() async {
    final networkUtils = NetworkUtils();
    await networkUtils.initialize();
    return networkUtils;
  });

  // Determine initial route
  final initialRoute = await hasPreviousSession();

  // Preserve splash until everything ready
  FlutterNativeSplash.preserve(widgetsBinding: we);

  runApp(MyApp(route: initialRoute));

  FlutterNativeSplash.remove();
}

Future<String> hasPreviousSession() async {
  final prefs = await SharedPreferences.getInstance();
  // final seenOnboarding = prefs.getBool('seenOnboarding') ?? false;
  final token = prefs.getString('auth_token');

  if (token != null && token.isNotEmpty) {
    ApiConstants.token = "Bearer $token";
    ApiConstants.headers = {
      "Accept": "application/json",
      "Authorization": ApiConstants.token
    };
    // return Routes.HOME;
  }
  return Routes.SPLASH_SCREEN;
  // if(seenOnboarding){
  //   return Routes.AUTH;
  // }
  // return Routes.ONBOARDING;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.route});

  final String route;

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(420, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        //You can use the library anywhere in the app even in theme
        // theme: theme(),
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: const Color(0xFFEBFAEB),
          textTheme: TextTheme(
            bodyMedium: TextStyle(
              color: Colors.grey[700],
              fontFamily: "FontMain",
            ),
          ),

          appBarTheme: AppBarTheme(
            backgroundColor: const Color(0xFF2E7D32), // Optional: set background color
            elevation: 0,
            centerTitle: true,
            // foregroundColor: Colors.white,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              // fontWeight: FontWeight.bold,
              // fontFamily: 'Fontappbar',
            ),
            iconTheme: IconThemeData(
              color: Colors.white, // for back button & icons
            ),
          ),
        ),
        //Language class from world_languages.dart
        //locale: Locale('ar', 'ae'),
        initialRoute: route,
        //Language class from world_languages.dart

        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        getPages: AppPages.routes,
      ),
    );
  }
}