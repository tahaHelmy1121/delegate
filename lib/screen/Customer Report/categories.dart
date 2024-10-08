import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/category_provider.dart';
import '../products_store/prodcuts_store.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ChangeNotifierProvider(
          create: (BuildContext context) => CategoryProvider(context: context),
          builder: (context, prov) {
            return context.watch<CategoryProvider>().reportLoad
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        context.watch<CategoryProvider>().reportLoad
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: 25,
                                  ),

                                  DropdownButtonFormField(
                                      alignment: Alignment.center,
                                      isExpanded: true,
                                      padding: const EdgeInsets.all(10),
                                      value: context
                                          .watch<CategoryProvider>()
                                          .categorySelected,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey.shade300,
                                        border: InputBorder.none,
                                      ),
                                      items: context
                                          .watch<CategoryProvider>()
                                          .categories!
                                          .map((value) {
                                        return DropdownMenuItem(
                                          value: value.productCatId,
                                          child: Text(
                                            value.productCatName.toString(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                            maxLines: 1,
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (v) async {
                                        context
                                            .read<CategoryProvider>()
                                            .categorySelected = v;
                                        print(v);
                                      }),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => productsStore(
                                                    productCategoryId: context
                                                        .read<
                                                            CategoryProvider>()
                                                        .categorySelected,
                                                  )));
                                    },
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          "بحث",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.0750,
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/images/3d-illustration-of-online-shop-app-on-mobile-png.webp",

                                    fit: BoxFit.cover,
                                  ),
                                ],
                              )
                            : CircularProgressIndicator(
                                color: Colors.black,
                              )
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
        title: Text("التصنيفات"),
      ),
    );
  }
}

Widget drewSearch({required double height, required BuildContext context}) {
  return Padding(
    padding: EdgeInsets.all(height * .50),
    child: TextFormField(
      controller: context.watch<CategoryProvider>().searchController,
      autofocus: false,
      keyboardType: TextInputType.text,
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
      decoration: InputDecoration(
        focusColor: Colors.white,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white)),
        errorStyle: TextStyle(
            fontSize: 12, color: Colors.red, fontWeight: FontWeight.bold),
        hintText: "ابحث عن تصنيفك",
        hintStyle: TextStyle(color: Colors.black),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        suffixIcon: InkWell(
          onTap: () {
            context.read<CategoryProvider>().getAllCategories(
                  search_name:
                      context.read<CategoryProvider>().searchController.text,
                );
          },
          child: Icon(Icons.search, color: Colors.black),
        ),
      ),
    ),
  );
}
