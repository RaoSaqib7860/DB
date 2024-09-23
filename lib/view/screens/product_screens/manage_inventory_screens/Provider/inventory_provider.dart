import 'package:flutter/cupertino.dart';

import '../../../../../api_repository/api_utils.dart';
import '../Model/inventory_model.dart';

class GetInventoryProvider extends ChangeNotifier{
  GetInvontoryModel? getInvontoryModel;

  Future get_inventoryApi({Map<String, dynamic>? map,bool? load=true}) async {
    var data = await DataProvider().inventoryInfoApi(map: map);
    getInvontoryModel = data;
    notifyListeners();
  }

  update_state() {
    notifyListeners();
  }
}