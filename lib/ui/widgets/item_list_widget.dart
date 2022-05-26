import 'package:flutter/material.dart';
import 'package:flutter_codigo5_sqflite_qr/models/license_model.dart';
import 'package:flutter_codigo5_sqflite_qr/ui/general/colors.dart';
import 'package:flutter_svg/svg.dart';

class ItemListWidget extends StatelessWidget {
  // String name;
  // String dni;
  // String url;

  LicenseModel licenseModel;
  Function onPressed;

  //LicenseModel? licenseModel;

  ItemListWidget({
    // required this.name,
    // required this.dni,
    // required this.url,

    required this.licenseModel,
    required this.onPressed,
    //this.licenseModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 10.0,
      ),
      margin: const EdgeInsets.symmetric(vertical: 7.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/bx-user.svg',
                      color: kFontPrimaryColor.withOpacity(0.6),
                      height: 13.0,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      "Nombres",
                      style: TextStyle(
                        color: kFontPrimaryColor.withOpacity(0.6),
                        fontSize: 13.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  // licenseModel?.name ?? "-",
                  licenseModel.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/bx-card.svg',
                      color: kFontPrimaryColor.withOpacity(0.6),
                      height: 13.0,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      "Nro. DNI",
                      style: TextStyle(
                        color: kFontPrimaryColor.withOpacity(0.6),
                        fontSize: 13.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  // licenseModel?.dni ?? "-",
                  licenseModel.dni,
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              onPressed();
            },
            icon: SvgPicture.asset(
              'assets/icons/bx-link.svg',
              color: kFontPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
