
import 'package:flutter/material.dart';

Widget drewCustomSearchField(
    {required BuildContext context,
      Function(String)? onTab,
      hint,
      required TextEditingController search}) {
  return Stack(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(14)),
            width:MediaQuery.of(context).size.width*0.8,
            child: TextFormField(
              autofocus: false,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  //          return "${AppLocalizations.of(context)!.search product}";
                }
              },

         //     controller: context.watch<SearchProvider>().search,
              style: TextStyle(letterSpacing: 1),
              textDirection: TextDirection.rtl,
              //      controller: context.read<LoginViewModel>().textEditingControllerMobile,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                fillColor: Colors.grey,
                hintText: hint,
                isDense: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),

                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

