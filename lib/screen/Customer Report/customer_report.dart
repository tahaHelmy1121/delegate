import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/fonts.dart';
import '../../provider/client_provider.dart';

class CustomerReport extends StatefulWidget {
  var clientId;

  CustomerReport({super.key, this.clientId});

  @override
  State<CustomerReport> createState() => _CustomerReportState();
}

class _CustomerReportState extends State<CustomerReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(
            "تقرير العميل",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        body: SingleChildScrollView(
          child: ChangeNotifierProvider(
            create: (BuildContext context) =>
                ClientProvider(context: context, clientId: widget.clientId),
            builder: (context, prov) {
              return SingleChildScrollView(
                  child: context.watch<ClientProvider>().reportLoad
                      ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  context
                                              .watch<ClientProvider>()
                                              .reportModel!
                                              .client!.clientname ==
                                          null
                                      ? Text(
                                          "",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        )
                                      :  Text(
                                    context
                                        .watch<ClientProvider>()
                                        .reportModel!
                                        .client!
                                        .clientname!
                                        .toString(),
                                    style: TextStyles.font24BlackBold
                                        .copyWith(fontSize: 14),
                                  ),
                                  SizedBox(

                                          child:  context
                                              .watch<ClientProvider>()
                                              .reportModel!
                                              .lastsellbilldate ==
                                              null?Text(""):Text(
                                            context
                                                .watch<ClientProvider>()
                                                .reportModel!
                                                .lastsellbilldate
                                                .toString(),
                                            style: TextStyles.font24BlackBold
                                                .copyWith(fontSize: 12),
                                          ),
                                        ),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  context
                                              .watch<ClientProvider>()
                                              .reportModel!
                                              .client!
                                              .clientdetails ==
                                          ""
                                      ? SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.7,
                                          child: Text(
                                            "",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                            maxLines: 2,
                                          ),
                                        )
                                      : Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          width: MediaQuery.of(context).size.width *0.8,
                                          child: Text(
                                            "",
                                              style: TextStyles.font24BlackBold
                                                  .copyWith(fontSize: 12),
                                                                              maxLines: 2,
                                                                              overflow: TextOverflow.clip,
                                            ),
                                        ),
                                      )
                                ],
                              ),
                              FittedBox(
                                child: DataTable(
                                    columns: [
                                      DataColumn(
                                        label: Padding(
                                          padding: EdgeInsets.only(left: 15),
                                          child: const Text(" مديونية العميل",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                              textAlign: TextAlign.center),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Padding(
                                          padding: EdgeInsets.only(left: 15),
                                          child: const Text("حد الدين",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                              textAlign: TextAlign.center),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Padding(
                                          padding: EdgeInsets.only(left: 15),
                                          child: const Text("الدين المتبقى",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                              textAlign: TextAlign.center),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Padding(
                                          padding: EdgeInsets.only(left: 15),
                                          child: const Text("اجمالى المبيعات",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                              textAlign: TextAlign.center),
                                        ),
                                      ),

                                    ],
                                    columnSpacing: 20,
                                    dataRowColor: MaterialStateProperty.all(
                                        Colors.grey.withOpacity(0.2)),
                                    dataRowHeight: 80,
                                    border: TableBorder.all(
                                      color: Colors.black,
                                      width: 1,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    rows: List.generate(1, (index) {
                                      return DataRow(cells: [
                                        DataCell(
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2,
                                              child: Text(context
                                                  .watch<ClientProvider>()
                                                  .reportModel!
                                                  .client!
                                                  .clientdebt
                                                  .toString(),style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),),
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Container(
                                            alignment: Alignment.center,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            child: Text(context
                                                .watch<ClientProvider>()
                                                .reportModel!
                                                .client!
                                                .debtlimit
                                                .toString(),style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      ),),
                                          ),
                                        ),
                                        DataCell(
                                          Container(
                                            alignment: Alignment.center,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            child: Text(context
                                                .watch<ClientProvider>()
                                                .reportModel!
                                                .client!
                                                .residual
                                                .toString(),style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),),
                                          ),
                                        ),
                                        DataCell(
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2,
                                              child: context
                                                          .watch<ClientProvider>()
                                                          .reportModel!
                                                          .lastsellbilldate ==
                                                      null
                                                  ? Text("")
                                                  : Text(context
                                                      .watch<ClientProvider>()
                                                      .reportModel!
                                                      .sellbilltotal
                                                      .toString(),style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),),
                                            ),
                                          ),
                                        ),

                                      ]);
                                    })),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              FittedBox(
                                child: DataTable(
                                    columns: [
                                      DataColumn(
                                        label: Padding(
                                          padding: EdgeInsets.only(left: 15),
                                          child: const Text(
                                              "اجمالى مبلغ  العملية",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                              textAlign: TextAlign.center),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Padding(
                                          padding: EdgeInsets.only(left: 15),
                                          child: const Text("تاريخ العملية",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                              textAlign: TextAlign.center),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Padding(
                                          padding: EdgeInsets.only(left: 15),
                                          child: const Text(" نوع العملية",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                              textAlign: TextAlign.center),
                                        ),
                                      ),
                                    ],
                                    columnSpacing: 45,
                                    dataRowColor: MaterialStateProperty.all(
                                        Colors.grey.withOpacity(0.2)),
                                    dataRowHeight: 80,
                                    border: TableBorder.all(
                                        color: Colors.black,
                                        width: 1,
                                        borderRadius: BorderRadius.circular(50)),
                                    rows: List.generate(
                                        context
                                            .watch<ClientProvider>()
                                            .reportModel!
                                            .clientdebtchanges!
                                            .length, (index) {
                                      return DataRow(cells: [
                                        DataCell(
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              child: Text(context
                                                  .watch<ClientProvider>()
                                                  .reportModel!
                                                  .clientdebtchanges![index]
                                                  .clientdebtchangeamount,style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),),
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              child: Text(context
                                                  .watch<ClientProvider>()!
                                                  .reportModel!
                                                  .clientdebtchanges![index]
                                                  .clientdebtchangedate,style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),),
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              child: Text(
                                                context
                                                    .watch<ClientProvider>()
                                                    .reportModel!
                                                    .clientdebtchanges![index]
                                                    .processname,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]);
                                    })),
                              ),
                            ],
                          )),
                      )
                      : Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        ));
            },
          ),
        ));
  }
}
