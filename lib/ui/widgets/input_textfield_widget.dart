import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_codigo5_sqflite_qr/ui/general/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputFieldWidget extends StatelessWidget {
  String text;
  String icon;
  int? maxLength;
  TextInputType? textInputType;
  List<FilteringTextInputFormatter>? inputFormartters;
  bool isDNI;
  TextEditingController controller;

  InputFieldWidget({
    required this.text,
    required this.icon,
    this.maxLength,
    this.textInputType,
    this.inputFormartters,
    required this.isDNI,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 14.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "$text:",
                style: TextStyle(
                  color: kFontPrimaryColor.withOpacity(0.6),
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    offset: const Offset(4, 4),
                    blurRadius: 12.0),
              ],
            ),
            child: TextFormField(
              controller: controller,
              maxLength: isDNI ? 8 : null,
              keyboardType: isDNI ? TextInputType.number : null,
              inputFormatters: isDNI
                  ? [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ]
                  : [],
              decoration: InputDecoration(
                counterText: "",
                filled: true,
                fillColor: Colors.white,
                hintText: text,
                hintStyle: TextStyle(
                  fontSize: 13.0,
                  color: kFontPrimaryColor.withOpacity(0.4),
                ),
                prefixIcon: SvgPicture.asset(
                  'assets/icons/$icon.svg',
                  height: 12.0,
                  fit: BoxFit.scaleDown,
                  color: kFontPrimaryColor.withOpacity(0.4),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "El campo es obligatorio";
                }

                if (isDNI) {
                  if (value.length < 8) {
                    return "El DNI necesita 8 números";
                  }
                }

                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
