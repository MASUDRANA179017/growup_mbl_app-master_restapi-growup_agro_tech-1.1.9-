import 'package:growup_agro/app/data/providers/base_provider.dart';
import 'package:growup_agro/utils/api_constants.dart';

class PropertyProvider extends BaseConnect{
  Future getPropertyList()async{
    var url = "${ApiConstants.baseUrl}/list";
    await safeApiCall(request: () => get(url, headers: ApiConstants.headers), onSuccess: (data){

    });
    //TODO: here will be logic of error handling and return response by using model
  }
}