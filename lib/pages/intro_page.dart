import 'package:flutter/material.dart';
import 'package:flutter_codigo5_sqflite_qr/pages/home_page.dart';
import 'package:flutter_codigo5_sqflite_qr/ui/general/colors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              "Tu carnet de vacunación",
              style: TextStyle(
                  fontSize: 46.0,
                  height: 1,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff2A2B30)),
            ),
            const SizedBox(
              height: 12.0,
            ),
            const Text(
              "Con esta App podrás gestionar los carnets de las personas que más prefieras. No olvides ser responsable",
              style: TextStyle(
                  fontSize: 16.0,
                  height: 1.4,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff2A2B30)),
            ),
            const SizedBox(
              height: 12.0,
            ),
            SizedBox(
              width: double.infinity,
              height: 52.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kBrandPrimaryColor,
                  // primary: Color(0xff04CD8B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: const Text(
                  "Iniciar ahora",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
