import 'package:flutter/cupertino.dart';

import '../../../../../api_repository/api_utils.dart';
import '../Model/inventory_model.dart';

class GetInventoryProvider extends ChangeNotifier{
  bool inventory_loading = false;
  GetInvontoryModel? getInvontoryModel;

  Future get_inventoryApi({Map<String, String>? map}) async {
    inventory_loading = true;
    notifyListeners();
    var data = await DataProvider().inventoryInfoApi(map: map);
    getInvontoryModel = data;
    inventory_loading = false;
    notifyListeners();
  }

  update_state() {
    notifyListeners();
  }
}