import 'package:growup_agro/app/data/providers/base_provider.dart';
import 'package:growup_agro/utils/api_constants.dart';

class PropertyProvider extends BaseGetConnect{
  Future getPropertyList()async{
    var url = "${ApiConstants.baseUrl}/list";
    final response = await get(url, headers: ApiConstants.headers);
    //TODO: here will be logic of error handling and return response by using model
  }
}