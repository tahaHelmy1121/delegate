import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:delegate/data/data/get_clients_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/helper/awesomedialog.dart';
import '../core/helper/massage.dart';
import '../core/helper/resultprocess.dart';
import '../custom_widget/drewnavbar.dart';
import '../data/data/get_filter_point_repo.dart';
import '../data/data/getclienterearepo.dart';
import '../data/data/getshopcategories_repo.dart';
import '../data/data/recrdregpointssalerepo.dart';
import '../data/data/registernewpoint.dart';
import '../data/model/get_client_erea.dart';
import '../data/model/get_register_client.dart';
import '../data/model/recordepoint.dart';
import '../data/model/register_new_point.dart';
import '../data/model/shop_categories.dart';

class GetAddPointProvider extends ChangeNotifier {
  BuildContext context;
 var clientereaId;
  GetAddPointProvider({required this.context ,this.clientereaId}) {
    fetchErea(context: context);
    fetchShop(context: context);
    fetchFilter();
  }

  bool _loading = false;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  var _ereaSelected;
  var _shopSelected;

  get shopSelected => _shopSelected;

  set shopSelected(value) {
    _shopSelected = value;
    notifyListeners();
  }

  get ereaSelected => _ereaSelected;

  set ereaSelected(value) {
    _ereaSelected = value;
    notifyListeners();
  }

  List<GetClientErea>? clienterea = [];

  fetchErea({
    required BuildContext context,
  }) async {
    clienterea = await Getclienterearepo.Geterea(context: context);
    if (clienterea!.isNotEmpty) {
      ereaSelected = clienterea!.first.id;
    }
    loading = true;
    notifyListeners();
  }

  bool _shoploading = false;

  bool get shoploading => _shoploading;

  set shoploading(bool value) {
    _shoploading = value;
    notifyListeners();
  }

  TextEditingController shopNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  List<ShopCategories>? shopCategories;

  fetchShop({
    required BuildContext context,
  }) async {
    shopCategories = await GetclientShoprepo.GetShop(context: context);
    if (shopCategories!.isNotEmpty) {
      shopSelected = shopCategories!.first.id;
    }
    shoploading = true;
//  loading = true;
    notifyListeners();
  }

  RegisterNewPoint? registerNewPoint;

  addPointFromRepo({lat, lng}) async {
    SharedPreferences? sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    var customerId = sharedPreferences.getString("user_id");
    registerNewPoint = await RegisterPoint.getRegister(
        context: context,
        userId: customerId,
        shop_category: shopSelected,
        clientareaid: ereaSelected,
        shop_name: shopNameController.text,
        contact_number: phoneController.text,
        lat: lat,
        lng: lng);

    if (registerNewPoint!.status == 1) {
      drewAwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          describe: registerNewPoint!.reason)
        ..show().then((value) {
          Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(
                pageBuilder: (context, animation, widget) =>
                    const DrewNavigationBar()),
            (route) => false,
          );
        });
      ;
    } else {
      MassageApp.snackBar(registerNewPoint!.reason.toString(), context);
    }
  }
  List<GetRegisterNewPoint>? getRegisterNewPoint = [];

  fetchFilter() async{
    getRegisterNewPoint =
    await    FilterRepo.Getfilter(context: context, clientareaid:clientereaId );
    loading = true;
    notifyListeners();
  }

  RecordePoint? record;
       addpointFromRepo({regpointssaleid}) async {
         SharedPreferences? sharedPreferences;
         sharedPreferences = await SharedPreferences.getInstance();
         var customerId = sharedPreferences.getString("user_id");
         record = await Recrdregpointssalerepo.recrdregpoint(
           context: context,
           regpointssaleid: regpointssaleid,
           user_id: customerId
         );

         if (record!.status == 1) {
           MassageApp.snackBar(record!.reason.toString(), context);

           fetchFilter();
           loading = true;
           notifyListeners();
         } else {
           MassageApp.snackBar(record!.reason.toString(), context);
         }
       }

}
