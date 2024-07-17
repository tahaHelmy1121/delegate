import 'package:delegate/generated/assets.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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
            SizedBox(height: 18,),
            Container(
              width:  MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.1,
              child: TextFormField(
textAlign: TextAlign.right,
                controller: TextEditingController(),
                maxLines: 5,
                decoration: InputDecoration(

                  labelText: "الاسم",
                  hintText: "الاسم الكامل",
                  isDense: true,
                  labelStyle: TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          width: 1, color: Colors.grey.shade200)),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          width: 1, color: Colors.grey.shade200)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          width: 1,
                          color: Colors.black.withOpacity(0.3))),
                ),
              ),
            ),
            SizedBox(height: 18,),
            Container(
              child: DropdownMenu(
                hintText: "المناطق المتاحة",
                  width: MediaQuery.of(context).size.width * 0.8,
                  inputDecorationTheme: InputDecorationTheme(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                          )),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40))),
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: "gt4", label: "المنصورة"),
                    DropdownMenuEntry(value: "gt4", label: "توريل"),
                    DropdownMenuEntry(value: "gt4", label: "المشاية"),
                    DropdownMenuEntry(value: "gt4", label: "طلخا")
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
