import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:growup_agro/app/theme/colors.dart';
import 'package:growup_agro/app/utils/utils.dart';
import 'package:growup_agro/utils/api_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shurjopay/utilities/functions.dart';

import 'app/routes/app_pages.dart';
import 'app/utils/network_utils.dart';

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
            backgroundColor: deepGreenColor, // Optional: set background color
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

// import 'package:flutter/material.dart';
// import 'package:growup_agro/splash_screen.dart';
// import 'package:growup_agro/views/IntroPage.dart';
// import 'package:growup_agro/views/Onboarding_Screen.dart';
// import 'package:growup_agro/views/ProfilePage.dart';
// import 'package:growup_agro/views/about_us_page.dart';
// import 'package:growup_agro/views/all_products_page.dart';
// import 'package:growup_agro/views/all_projects.dart';
// import 'package:growup_agro/views/all_properties.dart';
// import 'package:growup_agro/views/blogs_web.dart';
// import 'package:growup_agro/views/certificates_web.dart';
// import 'package:growup_agro/views/desposit_page.dart';
// import 'package:growup_agro/views/edit_profile_info.dart';
// import 'package:growup_agro/views/investment_history.dart';
// import 'package:growup_agro/views/invoice_capital_return.dart';
// import 'package:growup_agro/views/invoice_growup.dart';
// import 'package:growup_agro/views/invoice_recharge.dart';
// import 'package:growup_agro/views/invoice_roi.dart';
// import 'package:growup_agro/views/login.dart';
// import 'package:growup_agro/views/long_duration.dart';
// import 'package:growup_agro/views/my_orders_page.dart';
// import 'package:growup_agro/views/my_projects.dart';
// import 'package:growup_agro/views/news_web.dart';
// import 'package:growup_agro/views/project_certificate_page.dart';
// import 'package:growup_agro/views/register.dart';
// import 'package:growup_agro/views/live.dart';
// import 'package:growup_agro/views/short_duration.dart';
// import 'package:growup_agro/views/tax_certificate.dart';
// import 'package:growup_agro/views/wallet_history.dart';
// import 'package:growup_agro/views/withdraw_page.dart';
// import 'package:shurjopay/utilities/functions.dart';
//
// import 'main_screen.dart';
//
//
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   // initializeShurjopay(environment: 'sandbox');
//   initializeShurjopay(environment: "live"); // use live API
//   runApp(const MyApp());
// }
//
//
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/', // Splash screen is shown first
//       // home: IntroPage(),
//       routes: {
//         '/': (context) => const SplashScreen(),
//         '/onboarding': (context) => const OnboardingScreen(),
//         '/intro': (context) => const IntroPage(),
//         'register': (context) => const MyRegister(),
//         'login': (context) => const MyLogin(),
//
//         //dashboard
//         // '/dashboard': (context) => DashboardInvestor(),
//         '/mainscreen': (context) => MainScreen(),
//
//
//         //growup
//         '/projects': (context) => const AllProjectsPage(),
//         '/myprojects': (context) => const MyProjectsPage(),
//         '/investmenthistory': (context) => const InvestmentHistoryPage(),
//
//         '/products': (context) => const AllProductsPage(),
//         '/properties': (context) => const AllPropertiesPage(),
//
//
//         //Wallet
//         '/wallet': (context) => const WalletHistoryPage(),
//         '/deposit': (context) => const DepositPage(),
//         '/withdraw': (context) => const WithdrawPage(),
//         //Invoices
//         '/myprofile': (context) => EditProfilePage(),
//         '/profile': (context) => const InvestorProfilePage(),
//
//         '/long_term': (context) => const LongProjectsPage(),
//         '/short_term': (context) => const ShortProjectsPage(),
//         '/shariah': (context) => const LiveProjectsPage(),
//         '/all_projects': (context) => const AllProjectsPage(),
//         '/myorders': (context) => const MyOrdersPage(),
//         '/certificate': (context) => const CertificatePage(),
//         '/about_us': (context) => const AboutUsPage(),
//         '/news': (context) => const NewsPage(),
//         '/blogs': (context) => const BlogsPage(),
//
//         '/invoice_growup': (context) => const InvoiceGrowupPage(),
//         '/invoice_recharge': (context) => const InvoiceRechargePage(),
//         '/invoice_roi': (context) => const InvoiceRoiPage(),
//         '/capital_return': (context) => const CapitalReturnPage(),
//
//         '/tax_certificate': (context) => const TaxCertificatePage(),
//         '/project_certificate': (context) => const ProjectCertificatesPage(),
//       },
//
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//         scaffoldBackgroundColor: const Color(0xFFEBFAEB),
//         textTheme: TextTheme(
//           bodyMedium: TextStyle(
//             color: Colors.grey[700],
//             fontFamily: "FontMain",
//           ),
//         ),
//
//         appBarTheme: AppBarTheme(
//           backgroundColor: const Color(0xFF2E7D32), // Optional: set background color
//           elevation: 0,
//           centerTitle: true,
//           // foregroundColor: Colors.white,
//           titleTextStyle: TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//             // fontWeight: FontWeight.bold,
//             // fontFamily: 'Fontappbar',
//           ),
//           iconTheme: IconThemeData(
//             color: Colors.white, // for back button & icons
//           ),
//         ),
//       ),
//
//       //home: IntroPage(),
//     );
//   }
// }
