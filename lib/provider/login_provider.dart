import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:delegate/data/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/helper/awesomedialog.dart';
import '../core/helper/cache_helper.dart';
import '../core/helper/di.dart';
import '../core/helper/navigator.dart';
import '../data/data/login_repo.dart';
import '../screen/Visit history/Visit history_view.dart';

class LoginProvider extends ChangeNotifier {
  BuildContext context;

  LoginProvider({required this.context}){

  }


  TextEditingController _emailEdtingController = TextEditingController();
  TextEditingController _passwordEditingController = TextEditingController();

  TextEditingController get emailEdtingController => _emailEdtingController;

  set emailEdtingController(TextEditingController value) {
    _emailEdtingController = value;
  }

  GlobalKey<FormState> _formValidForm = GlobalKey<FormState>();

  GlobalKey<FormState> get formValidForm => _formValidForm;

  set formValidForm(GlobalKey<FormState> value) {
    _formValidForm = value;
    notifyListeners();
  }
  bool _loadData = false;

  bool get loadData => _loadData;

  set loadData(bool value) {
    _loadData = value;
    notifyListeners();
  }
  LoginModel? loginModel;
  submitLogin({required BuildContext context}) async {
    if (formValidForm.currentState!.validate()) {
      loadData=true;
      loginModel = await LoginRepo.getLogin(
          context: context, userName: emailEdtingController!.text, password: passwordEditingController!.text);
      if (loginModel!.status == 1) {
        return drewAwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            describe: loginModel!.reason)
            .show()
            .then((value) {
          SharedPreferences.getInstance()
              .then((value) => value.setString('user_id', loginModel!.userId.toString()));
          navigatorToScreen(
              context: context, removeStack: true, widget: VisitHistoryView());
        });
      } else {
        drewAwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            describe: loginModel!.reason)
          ..show();
        loadData=false;
      }
    }
  }

  TextEditingController get passwordEditingController =>
      _passwordEditingController;

  set passwordEditingController(TextEditingController value) {
    _passwordEditingController = value;
  }
}