import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:growup_agro/models/all_properties_new.dart';
import 'package:growup_agro/models/live_project_model.dart';
import 'package:growup_agro/utils/api_constants.dart';
import 'package:growup_agro/views/all_properties_details.dart';
import 'package:growup_agro/widgets/custom_button.dart';
import 'package:growup_agro/widgets/network_image.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import '../models/all_properties.model.dart';
import '../widgets/shimmer_grid.dart';

class AllPropertiesPageNew extends StatefulWidget {
  const AllPropertiesPageNew({super.key});

  @override
  State<AllPropertiesPageNew> createState() => _AllPropertiesPageNewState();
}

class _AllPropertiesPageNewState extends State<AllPropertiesPageNew> {
  // late Future<AllPropertiesNew> _futureProperties;
  List<LiveProject> projects = [];
  final ScrollController _scrollController = ScrollController();
  bool _showBackToTopButton = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchProperties();

    _scrollController.addListener(() {
      if (_scrollController.offset >= 300 && !_showBackToTopButton) {
        setState(() => _showBackToTopButton = true);
      } else if (_scrollController.offset < 300 && _showBackToTopButton) {
        setState(() => _showBackToTopButton = false);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> fetchProperties() async {
    isLoading = true;
    setState(() {

    });
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token') ?? '';
    // final investorCode = prefs.getString('investor_code') ?? '';

    log("url: ${ApiConstants.allPropertiesNew}");
    log("token: $token");
    final response = await http.get(Uri.parse(ApiConstants.allPropertiesNew), headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'});
    log(response.body);
    if (response.statusCode == 200) {
      isLoading = false;
      projects = AllPropertiesNew.fromJson(jsonDecode(response.body)).properties ?? [];
      // return AllPropertiesNew.fromJson(jsonDecode(response.body));
    } else {
      isLoading = false;
      projects = [];
      throw Exception("Failed to load properties");
    }
    setState(() {

    });
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = 2;
    if (screenWidth >= 600) crossAxisCount = 3;
    if (screenWidth >= 900) crossAxisCount = 4;
    if (screenWidth >= 1200) crossAxisCount = 5;

    return RefreshIndicator(
      onRefresh: ()async{
        fetchProperties();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "All Properties",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          backgroundColor: const Color(0xFF2E7D32),
          centerTitle: true,
          // actions: [
          //   IconButton(onPressed: (){
          //     fetchProperties();
          //   }, icon: Icon(Icons.ad_units))
          // ],
        ),
        backgroundColor: Colors.white,
        body: isLoading ? buildShimmerGrid(2) : GridView.builder(
          controller: _scrollController,
          padding: const EdgeInsets.all(12),
          itemCount: projects.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.3,
          ),
          itemBuilder: (context, index) {
            final property = projects[index];

            final project = projects[index];
            final statusInfo = _getProjectStatus(project);
            final String statusText = statusInfo['status'];

            final now = DateTime.now();
            final startDate = project.project_start_date != null &&
                project.project_start_date!.isNotEmpty
                ? DateTime.tryParse(project.project_start_date!)
                : null;

            final goal = project.investmentGoal ?? 0;
            final raised = project.raised ?? 0;

            final showUpcoming = startDate != null && now.isBefore(startDate);
            // final showInvestNow = project.status == 1 && raised <= goal;
            final showInvestNow = statusText == 'Investment Collecting';

            return _buildPropertyCard(property, showInvestNow: showInvestNow, showUpComing: showUpcoming, );
          },
        ),
        floatingActionButton: _showBackToTopButton
            ? FloatingActionButton(
          onPressed: _scrollToTop,
          backgroundColor: Colors.orange,
          child: const Icon(Icons.arrow_upward, color: Colors.white),
        )
            : null,
      ),
    );
  }

  Widget _buildPropertyCard(LiveProject package, {bool showInvestNow = false, bool showUpComing = false}) {

    return InkWell(
      onTap: ()async{
        // final prefs = await SharedPreferences.getInstance();
        // final token = prefs.getString('auth_token') ?? '';
        // final investorCode = prefs.getString('investor_code') ?? '';
        // log(investorCode);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PropertiesDetails(
              projectId: package.id,
              // investorCode: investorCode,
            ),
          ),
        );
      },
      child: Card(
        elevation: 2,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Image
            Expanded(
              // flex: 5,
              child: networkImage(package.imageUrl, height: double.infinity, width: double.infinity, radius: 12)
              // child: package.imageUrl == null ? SizedBox.shrink() : Image.network(
              //   package.imageUrl ?? '',
              //   fit: BoxFit.fill,
              //   width: double.infinity,
              //   errorBuilder: (_, __, ___) => Container(
              //     color: Colors.grey.shade200,
              //     child: const Icon(
              //       Icons.image_not_supported,
              //       color: Colors.grey,
              //       size: 40,
              //     ),
              //   ),
              // ),
            ),

            // Details
            Padding(
              padding: const EdgeInsets.all(10.0).copyWith(top: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Title & Location
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        package.projectName ?? '',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      // Row(
                      //   children: [
                      //     // Icon(
                      //     //   Icons.location_on_outlined,
                      //     //   color: Colors.grey.shade600,
                      //     //   size: 12,
                      //     // ),
                      //     // const SizedBox(width: 4),
                      //     // Expanded(
                      //     //   child: Text(
                      //     //     package.investmentType_name ?? '',
                      //     //     style: TextStyle(
                      //     //       fontSize: 12,
                      //     //       color: Colors.grey.shade600,
                      //     //     ),
                      //     //     maxLines: 1,
                      //     //     overflow: TextOverflow.ellipsis,
                      //     //   ),
                      //     // ),
                      //   ],
                      // ),
                    ],
                  ),

                  // SizedBox(height: 10,),
                  // getButton(showInvestNow: showInvestNow, showUpComing: showUpComing, investmentStartDate: formatDate(package.project_start_date)),
                  // // Stats Row
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     _buildStat(FontAwesomeIcons.bed, "3"),
                  //     _buildStat(FontAwesomeIcons.bath, "2"),
                  //     _buildStat(FontAwesomeIcons.rulerCombined, "1200 sqft"),
                  //   ],
                  // ),

                  // Full-width CustomButton
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: CustomButton(
                  //     text: "Coming Soon...",
                  //     onPressed: () {
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         const SnackBar(
                  //           content: Text("Coming soon: Property details page"),
                  //         ),
                  //       );
                  //     },
                  //     backgroundColor: const Color(0xFF2E7D32),
                  //     height: 28,
                  //     fontSize: 12,
                  //     borderRadius: 8,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Determine dynamic project status, color, and priority for sorting
  Map<String, dynamic> _getProjectStatus(LiveProject project) {
    final now = DateTime.now();

    DateTime? startDate = project.project_start_date != null &&
        project.project_start_date!.isNotEmpty
        ? DateTime.tryParse(project.project_start_date!)
        : null;

    DateTime? roiStartDate = project.roi_start_date != null &&
        project.roi_start_date!.isNotEmpty
        ? DateTime.tryParse(project.roi_start_date!)
        : null;

    DateTime? endDate = project.project_end_date != null &&
        project.project_end_date!.isNotEmpty
        ? DateTime.tryParse(project.project_end_date!)
        : null;

    String status = 'Unknown';
    int priority = 5;

    if (startDate != null &&
        roiStartDate != null &&
        now.isAfter(startDate) &&
        now.isBefore(roiStartDate)) {
      status = 'Investment Collecting';
      priority = 1;
    } else if (roiStartDate != null &&
        endDate != null &&
        now.isAfter(roiStartDate) &&
        now.isBefore(endDate)) {
      status = 'Running';
      priority = 2;
    } else if (startDate != null && now.isBefore(startDate)) {
      status = 'Upcoming';
      priority = 3;
    } else if (endDate != null && now.isAfter(endDate)) {
      status = 'Matured';
      priority = 4;
    }

    return {'status': status, 'priority': priority};
  }

// Widget _buildStat(IconData icon, String text) {
  //   return Row(
  //     children: [
  //       Icon(icon, size: 10, color: Colors.grey.shade500),
  //       const SizedBox(width: 4),
  //       Text(text, style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
  //     ],
  //   );
  // }

// Widget getButton({bool showInvestNow = false, bool showUpComing = false, String? investmentStartDate}){
//     if(showInvestNow){
//       return SizedBox(
//         width: double.infinity,
//         child: CustomButton(
//           text: "Invest Now",
//           backgroundColor: const Color(0xFF2E7D32),
//           textColor: Colors.white,
//           height: 24,
//           fontSize: 12,
//           borderRadius: 8,
//           isRound: true,
//           onPressed: (){},
//         ),
//       );
//     }
//     if(showUpComing){
//       return Container(
//         height: 35,
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           color: Colors.green,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Text(
//           investmentStartDate != null
//               ? 'Investment starts: $investmentStartDate'
//               : 'Upcoming',
//           maxLines: 1,
//           overflow: TextOverflow.ellipsis,
//           style: const TextStyle(color: Colors.white, fontSize: 12),
//         ),
//       );
//     }
//     return SizedBox.shrink();
// }

  // String formatDate(String? rawDate) {
  //   if (rawDate == null || rawDate.isEmpty) return 'N/A';
  //   try {
  //     final date = DateTime.parse(rawDate);
  //     return DateFormat('dd MMM yyyy').format(date);
  //   } catch (_) {
  //     return rawDate;
  //   }
  // }
}

