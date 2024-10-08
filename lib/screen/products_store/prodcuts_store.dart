import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/client_provider.dart';
import '../../provider/products_store_provider.dart';

class productsStore extends StatefulWidget {
  var productCategoryId;

  productsStore({
    required this.productCategoryId,
    super.key,
  });

  @override
  State<productsStore> createState() => _productsStoreState();
}

class _productsStoreState extends State<productsStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(
            "المخزون",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        body: SingleChildScrollView(
          child: ChangeNotifierProvider(
            create: (BuildContext context) => ProductsStoreProvider(
                context: context, productCategoryId: widget.productCategoryId),
            builder: (context, prov) {
              return SingleChildScrollView(
                  child: context.watch<ProductsStoreProvider>().reportLoad
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            child: Column(
                              children: [
                                FittedBox(
                                  child: DataTable(
                                      columns: [
                                        DataColumn(
                                          label: Padding(
                                            padding: EdgeInsets.only(left: 15),
                                            child: const Text("اسم المنتج",
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                                textAlign: TextAlign.center),
                                          ),
                                        ),
                                        DataColumn(
                                          label: Padding(
                                            padding: EdgeInsets.only(left: 30),
                                            child: const Text(" الكمية",
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                                textAlign: TextAlign.center),
                                          ),
                                        ),
                                      ],
                                      columnSpacing:
                                          MediaQuery.of(context).size.width *
                                              0.7,
                                      dataRowColor: MaterialStateProperty.all(
                                          Colors.grey.withOpacity(0.2)),
                                      dataRowHeight: 140,
                                      border: TableBorder.all(
                                        color: Colors.grey.shade300,
                                        width: 10,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      rows: List.generate(
                                          context
                                              .watch<ProductsStoreProvider>()
                                              .products
                                              .length, (index) {
                                        return DataRow(cells: [
                                          DataCell(
                                            Text(
                                             context.watch<ProductsStoreProvider>().products[index].productName.toString(),
                                              style: TextStyle(
                                                  color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              context.watch<ProductsStoreProvider>().products[index].productquantity.toString(),
                                              style: TextStyle(
                                                  color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),
                                            ),

                                          ),
                                        ]);
                                      })),
                                )
                              ],
                            ),
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(
                          color: Colors.black,
                        )));
            },
          ),
        ));
  }
}
