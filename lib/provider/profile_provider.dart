import 'package:delegate/custom_widget/drewnavbar.dart';
import 'package:delegate/screen/Visit%20history/Visit%20history_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/helper/massage.dart';
import '../data/data/get_profile_repo.dart';
import '../data/data/update_profile_repo.dart';
import '../data/model/profile.dart';
import '../data/model/update_ptofile.dart';

class ProfileProvider extends ChangeNotifier {
  BuildContext context;

  ProfileProvider({required this.context}) {
    getProfileFromRepo();
  }

  bool _profileLoading = false;

  bool get profileLoading => _profileLoading;

  set profileLoading(bool value) {
    _profileLoading = value;
    notifyListeners();
  }

  ProfileModel? profileModel;
  SharedPreferences? sharedPreferences;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  TextEditingController get nameController => _nameController;

  set nameController(TextEditingController value) {
    _nameController = value;
    notifyListeners();
  }

  getProfileFromRepo() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var user = sharedPreferences!.getString("user_id");
    profileModel =
        await ProfileRepo.GetProfile(context: context, user_id: user);
    passwordController = TextEditingController(text: profileModel!.password);
    profileLoading = true;
    notifyListeners();
  }

  TextEditingController get passwordController => _passwordController;

  set passwordController(TextEditingController value) {
    _passwordController = value;
    notifyListeners();
  }
  UpdateProfile? updateProfile;

  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();


  GlobalKey<FormState> get globalKey => _globalKey;

  set globalKey(GlobalKey<FormState> value) {
    _globalKey = value;
    notifyListeners();
  }
  editProfile({

    id, required BuildContext context , password}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    var customerId = sharedPreferences!.getString("user_id");
    if(globalKey.currentState!.validate()){
      updateProfile = await UpdateProfileRepo.getProfileRepo(
          user_id: customerId,
          password: password,
          context: context);
    }

    if (updateProfile!.status == 1) {
      MassageApp.snackBar(updateProfile!.reason.toString(), context);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => DrewNavigationBar()));
    } else {
      MassageApp.snackBar(updateProfile!.reason.toString(), context);
    }
  }

}
