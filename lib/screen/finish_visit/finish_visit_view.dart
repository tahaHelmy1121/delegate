import 'package:delegate/provider/finish_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/fonts.dart';

class finishVisit extends StatefulWidget {
  var endLat;
  var endLong;
  var clientId;
  var visit_id;
  var image;
  var clientEreaName;

  finishVisit(
      {super.key,
      this.image,
      this.endLat,
      this.endLong,
      this.clientId,
      this.clientEreaName,
      this.visit_id});

  @override
  State<finishVisit> createState() => _finishVisitState();
}

class _finishVisitState extends State<finishVisit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "انهاء  الزيارة",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext context) => FinishProvider(context: context),
        builder: (context, prov) {
          return SingleChildScrollView(
            child: context.watch<FinishProvider>().load
                ? Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(5)),
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.network(
                                        widget.image,
                                        fit: BoxFit.contain,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.250,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "اسم منطقة العميل : ${widget.clientEreaName}",
                                    style: TextStyles.font24BlackBold
                                        .copyWith(fontSize: 15)
                                        .copyWith(
                                            color: Colors.black,
                                            letterSpacing: 1),
                                    maxLines: 1,
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(14),
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        .300),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                child: Form(
                                  key: context.watch<FinishProvider>().globalKey,
                                  child: Column(
                                    children: [
                                      DropdownButtonFormField(
                                          alignment: Alignment.center,
                                          isExpanded: true,
                                          padding: const EdgeInsets.all(10),
                                          value: context
                                              .watch<FinishProvider>()
                                              .visitsCasessSelcted,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          items: context
                                              .watch<FinishProvider>()
                                              .visitsCasess!
                                              .map((value) {
                                            return DropdownMenuItem(
                                              value: value.id,
                                              child: Text(
                                                value.cases.toString(),
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600),
                                                maxLines: 1,
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (v) async {
                                            context
                                                .read<FinishProvider>()
                                                .visitsCasessSelcted = v;
                                            print(v);
                                          }),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      TextFormField(
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return "ادخل الملاحظة";
                                          }
                                          return null;
                                        },
                                        controller: context.watch<FinishProvider>().noteController,
                                        maxLines: 5,
                                        decoration: InputDecoration(
                                          labelText: "ملاحظة",
                                          labelStyle:
                                              TextStyle(color: Colors.black),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.grey.shade200)),
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.grey.shade200)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.black
                                                      .withOpacity(0.3))),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          context.read<FinishProvider>().finishFromRepo(
                                            visit_id: widget.visit_id,
                                            clientid: widget.clientId,
                                            endlat: widget.endLat,
                                            endlong: widget.endLong,


                                          );
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.5,
                                          child: Center(
                                              child: Center(
                                                  child: Text(
                                            "حفظ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                letterSpacing: 1,
                                                fontWeight: FontWeight.bold),
                                          ))),
                                          height: 60,
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
