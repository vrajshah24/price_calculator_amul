import 'package:flutter/material.dart';

import '../colors.dart';

textfield(String labelText, String hintText, int isRequired, double dwidth,
    TextEditingController controller) {
  return Column(
    children: [
      Container(
        width: dwidth,
        child: TextFormField(
          controller: controller,
          style: const TextStyle(
              color: Color(
                0xff495057,
              ),
              fontSize: 14),
          validator: (value) {
            if (isRequired == 1) {
              if (value == null || value.isEmpty) {
                return "$labelText Required";
              }
            } else {
              return null;
            }
          },
          textInputAction: TextInputAction.next,
          cursorColor: primaryColor,
          decoration: InputDecoration(
            errorStyle: const TextStyle(fontSize: 9),
            labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            contentPadding: const EdgeInsets.all(10),
            labelText: "$labelText *",
            filled: true,
            fillColor: Colors.white24,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      )
    ],
  );
}

textfieldforNumbers(String labelText, String hintText, int isRequired,
    double dwidth, TextEditingController controller, int maxLength) {
  return Column(
    children: [
      Container(
        width: dwidth,
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          maxLength: maxLength,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: const TextStyle(
            color: Color(
              0xff495057,
            ),
          ),
          validator: (value) {
            if (isRequired == 1) {
              if (value == null || value.isEmpty) {
                return "$labelText Required";
              }
            }
            return null;
          },
          cursorColor: primaryColor,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            counter: SizedBox.shrink(),
            errorStyle: const TextStyle(fontSize: 9),
            labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            contentPadding: const EdgeInsets.all(10),
            labelText: "$labelText *",
            filled: true,
            fillColor: Colors.white24,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      )
    ],
  );
}
