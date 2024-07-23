
import 'package:flutter/material.dart';

Widget drewCustomSearchField(
    {required BuildContext context,
      Function(String)? onTab,
      valid,
      hint,
      required TextEditingController controller}) {
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
           validator: valid,
              controller: controller,
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

