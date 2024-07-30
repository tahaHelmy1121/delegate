import 'package:delegate/screen/Customer%20Report/customer_report.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/client_provider.dart';

class SearchReport extends StatefulWidget {
  const SearchReport({super.key});

  @override
  State<SearchReport> createState() => _SearchReportState();
}

class _SearchReportState extends State<SearchReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ChangeNotifierProvider(
          create: (BuildContext context) => ClientProvider(context: context),
          builder: (context, prov) {
            return context.watch<ClientProvider>().load
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.09,
                          child: TextFormField(
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "ادخل كود العميل/الاسم";
                              }
                              return null;
                            },
                            textAlign: TextAlign.right,
                            controller: context
                                .watch<ClientProvider>()
                                .searchController,
                            maxLines: 5,
                            decoration: InputDecoration(
                              //    labelText: context.watch<ProfileProvider>().profileModel!.password,
                              hintText: "ادخل كود العميل/الاسم ",
                              isDense: true,
                              suffixIcon: InkWell(
                                  onTap: () {
                                    context
                                        .read<ClientProvider>()
                                        .fetchClients(context: context);
                                  },
                                  child: Icon(
                                    Icons.search_outlined,
                                    size: 35,
                                  )),
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
                        SizedBox(
                          height: 20,
                        ),
                        context.watch<ClientProvider>().client!.isEmpty
                            ? Center(
                                child: Text("لا يوجد نتائج"),
                              )
                            : SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: ListView.builder(
                                  physics: ScrollPhysics(),
                                    itemCount: context
                                        .watch<ClientProvider>()
                                        .client!
                                        .length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () {
                                            print(context
                                                .read<ClientProvider>()
                                                .client![index]
                                                .clientid);
                                            context
                                                .read<ClientProvider>()
                                                .getReport();
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        CustomerReport(
                                                          clientId: context
                                                              .read<
                                                                  ClientProvider>()
                                                              .client![index]
                                                              .clientid,
                                                        )));
                                          },
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey.shade300,
                                                  width: 1),
                                              color: Colors.grey.shade200,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "العميل : ",
                                                  ),
                                                ),
                                                Text(
                                                  context
                                                      .watch<ClientProvider>()
                                                      .client![index]
                                                      .clientname,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
          },
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("البحث عن تقرير"),
      ),
    );
  }
}
