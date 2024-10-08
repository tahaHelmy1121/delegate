import 'package:delegate/provider/addnewpoint_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterPoint extends StatefulWidget {
  const FilterPoint({super.key});

  @override
  State<FilterPoint> createState() => _FilterPointState();
}

class _FilterPointState extends State<FilterPoint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ChangeNotifierProvider(
          create: (BuildContext context) => GetAddPointProvider(context: context),
          builder: (context, prov) {
            return context.watch<GetAddPointProvider>().loading
                ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  context.watch<GetAddPointProvider>().loading
                      ? Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: DropdownButtonFormField(
                              alignment: Alignment.center,
                              isExpanded: true,
                              padding: const EdgeInsets.all(10),
                              value: context
                                  .watch<GetAddPointProvider>()
                                  .ereaSelected,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                border: InputBorder.none,
                              ),
                              items: context
                                  .watch<GetAddPointProvider>()
                                  .clienterea!
                                  .map((value) {
                                return DropdownMenuItem(
                                  value: value.id,
                                  child: Text(
                                    value.text.toString(),
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                    maxLines: 1,
                                  ),
                                );
                              }).toList(),
                              onChanged: (v) async {
                                context
                                    .read<GetAddPointProvider>()
                                    .ereaSelected = v;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      InkWell(
                        onTap: () {

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
        title: Text("سجل نقطة البيع المسجلة "),
      ),
    );
  }
}

// Widget drewSearch({required double height, required BuildContext context}) {
//   return Padding(
//     padding: EdgeInsets.all(height * .50),
//     child: TextFormField(
//       controller: context.watch<CategoryProvider>().searchController,
//       autofocus: false,
//       keyboardType: TextInputType.text,
//       style: TextStyle(
//           fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
//       decoration: InputDecoration(
//         focusColor: Colors.white,
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//             borderSide: BorderSide(color: Colors.white)),
//         errorStyle: TextStyle(
//             fontSize: 12, color: Colors.red, fontWeight: FontWeight.bold),
//         hintText: "ابحث عن تصنيفك",
//         hintStyle: TextStyle(color: Colors.black),
//         filled: true,
//         fillColor: Colors.white,
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//         suffixIcon: InkWell(
//           onTap: () {
//             context.read<CategoryProvider>().getAllCategories(
//               search_name:
//               context.read<CategoryProvider>().searchController.text,
//             );
//           },
//           child: Icon(Icons.search, color: Colors.black),
//         ),
//       ),
//     ),
//   );
// }
