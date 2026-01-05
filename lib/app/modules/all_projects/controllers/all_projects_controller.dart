import 'package:get/get.dart';
import 'package:growup_agro/app/data/models/all_project_model/AllProjectModel.dart';
import 'package:growup_agro/app/data/providers/all_projects_provider/all_projects_provider.dart';

class AllProjectsController extends GetxController {

  final AllProjectsProvider _provider = AllProjectsProvider();
  Rx<AllProjectModel?> allProject = Rxn(null);
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllProject();
  }

  Future<void> getAllProject()async{
    allProject.value = await _provider.getAllProjects(isLoading: isLoading);
  }

}
