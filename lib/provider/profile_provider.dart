import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/data/get_profile_repo.dart';
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
    nameController = TextEditingController(text: profileModel!.username);
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
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  editProfile({

    id, required BuildContext context}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    var customerId = sharedPreferences!.getString("user_id");
    if(globalKey.currentState!.validate()){
      updateProfile = await UpdateProfileRepo.getUpdateProfile(
          id: customerId.toString(),
          firstName:firstnameController.text ,
          userName: nameController.text,
          userEmail: emailController.text,
          mobile: phoneController.text,
          password: passwordController.text,
          context: context);
    }

    if (updateProfile!.status == 1) {
      MassageApp.snackBar(updateProfile!.reason.toString(), context);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => HomeScreenMain()));
    } else {
      MassageApp.snackBar(updateProfile!.reason.toString(), context);
    }
  }

}
