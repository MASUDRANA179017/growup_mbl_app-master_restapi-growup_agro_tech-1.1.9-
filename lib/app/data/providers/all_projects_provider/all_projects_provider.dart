//final url = Uri.parse(ApiConstants.allProjects());
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('auth_token');

import 'package:get/get.dart';
import 'package:growup_agro/app/component/logger/print_global.dart';
import 'package:growup_agro/app/data/models/all_project_model/AllProjectModel.dart';
import 'package:growup_agro/app/data/providers/base_provider.dart';

import '../../../../utils/api_constants.dart';

class AllProjectsProvider extends GetConnect {

  Future<AllProjectModel?> getAllProjects({RxBool? isLoading}) async {
    var url = "${ApiConstants.baseUrl}/all-projects";
    globalPrint(url);
    return await safeApiCall<AllProjectModel>(
      request: () => get(url, headers: ApiConstants.headers),
      onSuccess: (json) => AllProjectModel.fromJson(json),
      isLoading: isLoading
    );
  }

}
