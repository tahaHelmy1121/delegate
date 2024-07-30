import 'package:delegate/provider/login_provider.dart';
import 'package:delegate/screen/login/widget/custom_auth_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../../core/theme/fonts.dart';
import '../../custom_widget/drewnavbar.dart';
import '../Visit history/Visit history_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var address;
  var lat;
  var lng;
  void initState() {
    getCurrentLocation().then((value) async {
      print('${value.latitude}********${value.longitude}');
      lat = value.latitude;
      lng = value.longitude;

      print(address.toString());

      setState(() {});
    });
    setState(() {

    });
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(color: Colors.blueGrey),
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width,
                        ),
                        Image.asset(
                          "assets/images/delivery-boy-2496108-2096425.webp",
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.3,
                        ),
                      ],
                    ),
                  ],
                ),
                ChangeNotifierProvider(
  create: (BuildContext context) => LoginProvider(context: context),
builder: (context , prov){
    return Form(
      key: context.watch<LoginProvider>().formValidForm,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*.350),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Column(
                  children: [
                    Text(
                      "اهلا بك قم بتسجيل الدخول",
                      style: TextStyles.font24BlackBold
                          .copyWith(fontSize: 19, letterSpacing: 1),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    drewCustomSearchField(
                      valid: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "الرجاء ادخال الاسم";
                        }
                        return null;
                      },
                        context: context,
                        controller: context.watch<LoginProvider>().emailEdtingController,
                        hint: "الاسم"),
                    SizedBox(
                      height: 30,
                    ),
                    drewCustomSearchField(
                      valid: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "الرجاء ادخال كلمة المرور";
                        }
                        return null;
                      },
                        context: context,
                        controller: context.watch<LoginProvider>().passwordEditingController,
                        hint: "كلمة المرور"),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: (){
                        context.read<LoginProvider>().submitLogin(context: context);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Center(
                            child: Center(
                                child: Text(
                                  "تسجيل الدخول",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold),
                                ))),
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
},
),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}


Future<Position> getCurrentLocation() async {
  await Geolocator.requestPermission()
      .then((value) {})
      .onError((error, stackTrace) {
    print('error is $error');
  });
  return await Geolocator.getCurrentPosition();
}
