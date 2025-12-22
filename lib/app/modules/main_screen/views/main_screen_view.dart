import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:growup_agro/app/routes/app_pages.dart';
import 'package:growup_agro/views/ProfilePage.dart';
import 'package:growup_agro/views/about_us_page.dart';
import 'package:growup_agro/views/all_projects.dart';
import 'package:growup_agro/views/all_products_page.dart';
import 'package:growup_agro/views/all_properties.dart';
import 'package:growup_agro/views/blogs_web.dart';
import 'package:growup_agro/views/desposit_page.dart';
import 'package:growup_agro/views/edit_profile_info.dart';
import 'package:growup_agro/views/investor_dashboard.dart';
import 'package:growup_agro/views/invoice_capital_return.dart';
import 'package:growup_agro/views/invoice_growup.dart';
import 'package:growup_agro/views/invoice_recharge.dart';
import 'package:growup_agro/views/invoice_roi.dart';
import 'package:growup_agro/views/my_orders_page.dart';
import 'package:growup_agro/views/my_projects.dart';
import 'package:growup_agro/views/news_web.dart';
import 'package:growup_agro/views/project_certificate_page.dart';
import 'package:growup_agro/views/tax_certificate.dart';
import 'package:growup_agro/views/wallet_history.dart';
import 'package:growup_agro/views/withdraw_page.dart';
import 'package:growup_agro/widgets/bottom_nav_bar.dart';
import 'package:growup_agro/widgets/custom_button.dart';
import 'package:growup_agro/utils/api_constants.dart';

import '../../../../views/investment_history.dart';
import '../controllers/main_screen_controller.dart';

class MainScreenView extends GetView<MainScreenController> {
  const MainScreenView({super.key});

  final List<Widget> pages = const [
    DashboardInvestor(),
    AllProjectsPage(),
    AllProductsPage(),
    AllPropertiesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      key: controller.scaffoldKey,
      endDrawer: _buildDrawer(context),
      body: IndexedStack(
        index: controller.selectedIndex.value,
        children: pages,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: controller.bottomNavIndex.value,
        onItemTapped: controller.onItemTapped,
      ),
    ));
  }

  Widget _buildDrawer(BuildContext context) {
    final profile = controller.profile;

    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        top: false,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF2E7D32)),
              margin: EdgeInsets.zero,
              accountName: Text(
                profile['name'] ?? 'No Name',
                style: const TextStyle(color: Colors.white),
              ),
              accountEmail: Row(
                children: [
                  const Icon(Icons.person, color: Colors.white, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    profile['code'] ?? '',
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                      Future.delayed(const Duration(milliseconds: 200), () {
                        // Navigator.pushNamed(context, '/myprofile');
                        // Get.toNamed(Routes.EDIT_PROFILE);
                        Get.to(EditProfilePage());
                      });
                    },
                    child: Image.asset(
                      'assets/icons/edit.png',
                      width: 24,
                      height: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: profile['image'] != null &&
                    profile['image'].toString().isNotEmpty
                    ? NetworkImage("${ApiConstants.imgBaseUrl}/storage/${profile['image']}")
                    : const AssetImage('assets/images/img.png') as ImageProvider,
              ),
            ),

            /// ------------------- Menu Items -------------------
            _drawerTile(FontAwesomeIcons.gaugeHigh, 'Dashboard', Scaffold(), noRoute: true), //TODO: check

            ExpansionTile(
              leading: const Icon(FontAwesomeIcons.wallet, color: Colors.green, size: 20),
              title: const Text('Wallet', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              childrenPadding: const EdgeInsets.only(left: 30),
              children: [
                _drawerTile(FontAwesomeIcons.wallet, 'My Wallet', WalletHistoryPage()),
                _drawerTile(FontAwesomeIcons.moneyCheck, 'Deposit', DepositPage()),
                _drawerTile(FontAwesomeIcons.arrowDown, 'Withdraw', WithdrawPage()),
              ],
            ),

            ExpansionTile(
              leading: const Icon(FontAwesomeIcons.seedling, color: Colors.green, size: 20),
              title: const Text('Growup', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              childrenPadding: const EdgeInsets.only(left: 30),
              children: [
                _drawerTile(FontAwesomeIcons.folderOpen, 'Projects', AllProductsPage()),
                _drawerTile(FontAwesomeIcons.diagramProject, 'Invested Projects', MyProjectsPage()),
              ],
            ),

            ExpansionTile(
              leading: const Icon(FontAwesomeIcons.fileInvoiceDollar, color: Colors.green, size: 20),
              title: const Text('Invoices', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              childrenPadding: const EdgeInsets.only(left: 30),
              children: [
                _drawerTile(FontAwesomeIcons.fileInvoice, 'Growup', InvoiceGrowupPage()),
                _drawerTile(FontAwesomeIcons.warehouse, 'Property', Scaffold(), noRoute: true), //TODO: invoice property
                _drawerTile(FontAwesomeIcons.fileInvoiceDollar, 'Recharge', InvoiceRechargePage()),
                _drawerTile(FontAwesomeIcons.coins, 'ROI', InvoiceRoiPage()),
                _drawerTile(FontAwesomeIcons.handHoldingDollar, 'Capital Return', CapitalReturnPage()),
              ],
            ),

            _drawerTile(FontAwesomeIcons.clockRotateLeft, 'Investment History', InvestmentHistoryPage()),

            ExpansionTile(
              leading: const Icon(FontAwesomeIcons.building, color: Colors.green, size: 20),
              title: const Text('Properties', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              childrenPadding: const EdgeInsets.only(left: 30),
              children: [
                _drawerTile(FontAwesomeIcons.building, 'Package Details', AllPropertiesPage()),
                _drawerTile(FontAwesomeIcons.bagShopping, 'Ordered Properties', Scaffold(), noRoute: true),//TODO: ordered properties
              ],
            ),

            ExpansionTile(
              leading: const Icon(FontAwesomeIcons.box, color: Colors.green, size: 20),
              title: const Text('Products', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              childrenPadding: const EdgeInsets.only(left: 30),
              children: [
                _drawerTile(FontAwesomeIcons.box, 'All Products', AllProductsPage()),
                _drawerTile(FontAwesomeIcons.cartShopping, 'My Cart', Scaffold(), noRoute: true), //TODO: Cart page
                _drawerTile(FontAwesomeIcons.boxOpen, 'My Orders', MyOrdersPage()),
                _drawerTile(FontAwesomeIcons.truck, 'Track My Orders', Scaffold(), noRoute: true), //TODO: track orders
              ],
            ),

            _drawerTile(FontAwesomeIcons.user, 'Profile', InvestorProfilePage()),

            ExpansionTile(
              leading: const Icon(FontAwesomeIcons.certificate, color: Colors.green, size: 20),
              title: const Text('Certification', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              childrenPadding: const EdgeInsets.only(left: 30),
              children: [
                _drawerTile(FontAwesomeIcons.fileLines, 'TAX Certificate', TaxCertificatePage()),
                _drawerTile(FontAwesomeIcons.coins, 'Investment Certificate', ProjectCertificatesPage()),
              ],
            ),

            _drawerTile(FontAwesomeIcons.circleInfo, 'About Us', AboutUsPage()),
            _drawerTile(FontAwesomeIcons.newspaper, 'News', NewsPage()),
            _drawerTile(FontAwesomeIcons.blog, 'Blog', BlogsPage()),

            const Divider(height: 20, thickness: 1, color: Colors.green),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: CustomButton(
                text: "Logout",
                icon: Icons.logout,
                onPressed: controller.logout,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                height: 45,
                borderRadius: 10,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerTile(IconData icon, String title, Widget page, {bool noRoute = false}) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      visualDensity: const VisualDensity(vertical: -4),
      leading: Icon(icon, color: Colors.green, size: 16),
      title: Text(title, style: const TextStyle(fontSize: 13)),
      onTap: () {
        Get.back(); // close drawer
        Future.delayed(const Duration(milliseconds: 250), () {
          // Get.toNamed(route);
          noRoute ? null : Get.to(page);
          // Navigator.pushNamed(Get.context!, '/myprofile');
        });
      },
    );
  }
}
