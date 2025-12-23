import 'package:flutter/material.dart';

import 'package:get/get_navigation/src/routes/get_route.dart';

import '../modules/about_us/bindings/about_us_binding.dart';
import '../modules/about_us/views/about_us_view.dart';
import '../modules/all_products/bindings/all_products_binding.dart';
import '../modules/all_products/views/all_products_view.dart';
import '../modules/all_project_details/bindings/all_project_details_binding.dart';
import '../modules/all_project_details/views/all_project_details_view.dart';
import '../modules/all_projects/bindings/all_projects_binding.dart';
import '../modules/all_projects/views/all_projects_view.dart';
import '../modules/all_properties/bindings/all_properties_binding.dart';
import '../modules/all_properties/views/all_properties_view.dart';
import '../modules/blogs/bindings/blogs_binding.dart';
import '../modules/blogs/views/blogs_view.dart';
import '../modules/capital_return/bindings/capital_return_binding.dart';
import '../modules/capital_return/views/capital_return_view.dart';
import '../modules/certificate/bindings/certificate_binding.dart';
import '../modules/certificate/views/certificate_view.dart';
import '../modules/deposit/bindings/deposit_binding.dart';
import '../modules/deposit/views/deposit_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/intro_page/bindings/intro_page_binding.dart';
import '../modules/intro_page/views/intro_page_view.dart';
import '../modules/investment_history/bindings/investment_history_binding.dart';
import '../modules/investment_history/views/investment_history_view.dart';
import '../modules/investor_profile/bindings/investor_profile_binding.dart';
import '../modules/investor_profile/views/investor_profile_view.dart';
import '../modules/invoice_growup/bindings/invoice_growup_binding.dart';
import '../modules/invoice_growup/views/invoice_growup_view.dart';
import '../modules/invoice_recharge/bindings/invoice_recharge_binding.dart';
import '../modules/invoice_recharge/views/invoice_recharge_view.dart';
import '../modules/invoice_roi/bindings/invoice_roi_binding.dart';
import '../modules/invoice_roi/views/invoice_roi_view.dart';
import '../modules/live_projects/bindings/live_projects_binding.dart';
import '../modules/live_projects/views/live_projects_view.dart';
import '../modules/long_projects/bindings/long_projects_binding.dart';
import '../modules/long_projects/views/long_projects_view.dart';
import '../modules/main_screen/bindings/main_screen_binding.dart';
import '../modules/main_screen/views/main_screen_view.dart';
import '../modules/my_login/bindings/my_login_binding.dart';
import '../modules/my_login/views/my_login_view.dart';
import '../modules/my_orders/bindings/my_orders_binding.dart';
import '../modules/my_orders/views/my_orders_view.dart';
import '../modules/my_projects/bindings/my_projects_binding.dart';
import '../modules/my_projects/views/my_projects_view.dart';
import '../modules/my_register/bindings/my_register_binding.dart';
import '../modules/my_register/views/my_register_view.dart';
import '../modules/news/bindings/news_binding.dart';
import '../modules/news/views/news_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/project_certificate/bindings/project_certificate_binding.dart';
import '../modules/project_certificate/views/project_certificate_view.dart';
import '../modules/propertie_details/bindings/propertie_details_binding.dart';
import '../modules/propertie_details/views/propertie_details_view.dart';
import '../modules/short_projects/bindings/short_projects_binding.dart';
import '../modules/short_projects/views/short_projects_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/tax_certificate/bindings/tax_certificate_binding.dart';
import '../modules/tax_certificate/views/tax_certificate_view.dart';
import '../modules/wallet_history/bindings/wallet_history_binding.dart';
import '../modules/wallet_history/views/wallet_history_view.dart';
import '../modules/withdraw/bindings/withdraw_binding.dart';
import '../modules/withdraw/views/withdraw_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MY_LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT_US,
      page: () => const AboutUsView(),
      binding: AboutUsBinding(),
    ),
    GetPage(
      name: _Paths.ALL_PRODUCTS,
      page: () => const AllProductsView(),
      binding: AllProductsBinding(),
    ),
    GetPage(
      name: _Paths.ALL_PROJECTS,
      page: () => const AllProjectsView(),
      binding: AllProjectsBinding(),
    ),
    GetPage(
      name: _Paths.ALL_PROPERTIES,
      page: () => const AllPropertiesView(),
      binding: AllPropertiesBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.INTRO_PAGE,
      page: () => const IntroPageView(),
      binding: IntroPageBinding(),
    ),
    GetPage(
      name: _Paths.MY_REGISTER,
      page: () => const MyRegisterView(),
      binding: MyRegisterBinding(),
    ),
    GetPage(
      name: _Paths.MY_LOGIN,
      page: () => const MyLoginView(),
      binding: MyLoginBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_SCREEN,
      page: () => const MainScreenView(),
      binding: MainScreenBinding(),
    ),
    GetPage(
      name: _Paths.INVESTMENT_HISTORY,
      page: () => const InvestmentHistoryView(),
      binding: InvestmentHistoryBinding(),
    ),
    GetPage(
      name: _Paths.WALLET_HISTORY,
      page: () => const WalletHistoryView(),
      binding: WalletHistoryBinding(),
    ),
    GetPage(
      name: _Paths.DEPOSIT,
      page: () => const DepositView(),
      binding: DepositBinding(),
    ),
    GetPage(
      name: _Paths.WITHDRAW,
      page: () => const WithdrawView(),
      binding: WithdrawBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.INVESTOR_PROFILE,
      page: () => const InvestorProfileView(),
      binding: InvestorProfileBinding(),
    ),
    GetPage(
      name: _Paths.LONG_PROJECTS,
      page: () => const LongProjectsView(),
      binding: LongProjectsBinding(),
    ),
    GetPage(
      name: _Paths.SHORT_PROJECTS,
      page: () => const ShortProjectsView(),
      binding: ShortProjectsBinding(),
    ),
    GetPage(
      name: _Paths.LIVE_PROJECTS,
      page: () => const LiveProjectsView(),
      binding: LiveProjectsBinding(),
    ),
    GetPage(
      name: _Paths.MY_ORDERS,
      page: () => const MyOrdersView(),
      binding: MyOrdersBinding(),
    ),
    GetPage(
      name: _Paths.CERTIFICATE,
      page: () => const CertificateView(),
      binding: CertificateBinding(),
    ),
    GetPage(
      name: _Paths.NEWS,
      page: () => const NewsView(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: _Paths.BLOGS,
      page: () => const BlogsView(),
      binding: BlogsBinding(),
    ),
    GetPage(
      name: _Paths.INVOICE_GROWUP,
      page: () => const InvoiceGrowupView(),
      binding: InvoiceGrowupBinding(),
    ),
    GetPage(
      name: _Paths.INVOICE_RECHARGE,
      page: () => const InvoiceRechargeView(),
      binding: InvoiceRechargeBinding(),
    ),
    GetPage(
      name: _Paths.INVOICE_ROI,
      page: () => const InvoiceRoiView(),
      binding: InvoiceRoiBinding(),
    ),
    GetPage(
      name: _Paths.CAPITAL_RETURN,
      page: () => const CapitalReturnView(),
      binding: CapitalReturnBinding(),
    ),
    GetPage(
      name: _Paths.TAX_CERTIFICATE,
      page: () => const TaxCertificateView(),
      binding: TaxCertificateBinding(),
    ),
    GetPage(
      name: _Paths.PROJECT_CERTIFICATE,
      page: () => const ProjectCertificateView(),
      binding: ProjectCertificateBinding(),
    ),
    GetPage(
      name: _Paths.MY_PROJECTS,
      page: () => const MyProjectsView(),
      binding: MyProjectsBinding(),
    ),
    GetPage(
      name: _Paths.ALL_PROJECT_DETAILS,
      page: () => const AllProjectDetailsView(),
      binding: AllProjectDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PROPERTIE_DETAILS,
      page: () => const PropertiesDetailsView(),
      binding: PropertieDetailsBinding(),
    ),
  ];
}
