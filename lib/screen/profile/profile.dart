import 'package:delegate/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "الملف الشخصى",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset(
                    "assets/images/icons8-user-80.png",
                    fit: BoxFit.contain,
                  ),
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 140,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(50)),
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            ChangeNotifierProvider(
              create: (BuildContext context) =>
                  ProfileProvider(context: context),
              builder: (context, prov) {
                return context.watch<ProfileProvider>().profileLoading
                    ? Form(
                        key: context.read<ProfileProvider>().globalKey,
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Center(
                                  child: Text(
                                "اسم المستخدم :${context.watch<ProfileProvider>().profileModel!.username}",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: TextFormField(
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "الرجاء ادخال كلمة المرور";
                                  }
                                  return null;
                                },
                                textAlign: TextAlign.right,
                                controller: passwordController,
                                maxLines: 5,
                                decoration: InputDecoration(
                              //    labelText: context.watch<ProfileProvider>().profileModel!.password,
                                  hintText: "كلمة السر الجديدة ",
                                  isDense: true,
                                  labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.grey.shade200)),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.grey.shade200)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          width: 1,
                                          color:
                                              Colors.black.withOpacity(0.3))),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            InkWell(
                              onTap: () {
                                context.read<ProfileProvider>().editProfile(
                                    context: context,
                                    password:passwordController.text);
                              },
                              child: Container(
                                child: Center(
                                    child: Text(
                                  "تحديث البيانات",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                )),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.black),
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                width: MediaQuery.of(context).size.width * 0.6,
                              ),
                            )
                          ],
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(
                        color: Colors.black,
                      ));
              },
            ),
            SizedBox(
              height: 18,
            ),
          ],
        ),
      ),
    );
  }
}
