import 'package:delegate/screen/chioce_point_add/show_point_sale/filter_erea.dart';
import 'package:flutter/material.dart';

import 'add_new_point/add_new_point.dart';

class ChoicePointView extends StatefulWidget {
  const ChoicePointView({super.key});

  @override
  State<ChoicePointView> createState() => _ChoicePointViewState();
}

class _ChoicePointViewState extends State<ChoicePointView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "اختيار نقطة بيع ",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black.withOpacity(0.2)),
                  ),
                  child: Image.asset(
                    "assets/images/R.png",
                    width: MediaQuery.of(context).size.width * .5,
                    height: MediaQuery.of(context).size.height * .2,
                    fit: BoxFit.contain,
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>FilterPoint()));
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(
                            "سجل نقط البيع المسجلة",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                          margin: EdgeInsets.all(25),

                          width: MediaQuery.of(context).size.width * .4,
                          height: 45,
                        ),
                        SizedBox(height: 4,),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>AddNewPointView()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Text(
                                  "تسجيل نقطة بيع جديدة",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                            margin: EdgeInsets.all(25),

                            width: MediaQuery.of(context).size.width * .4,
                            height: 45,
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey.shade100),

                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
