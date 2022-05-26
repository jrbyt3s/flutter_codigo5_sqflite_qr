import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_codigo5_sqflite_qr/pages/register_page.dart';
import 'package:flutter_codigo5_sqflite_qr/ui/general/colors.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerQRPage extends StatefulWidget {
  @override
  State<ScannerQRPage> createState() => _ScannerQRPageState();
}

class _ScannerQRPageState extends State<ScannerQRPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  String patternUrl =
      r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
  bool isUrl = false;
  String _dataUrl = "";

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 260.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: kBrandPrimaryColor,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 7,
        cutOutSize: scanArea,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    RegExp regExp = RegExp(patternUrl);
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        if (result != null) {
          _dataUrl = result!.code!;
          isUrl = regExp.hasMatch(_dataUrl);
        }
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Aqui colocamos el QR Scanner: _buildQrView(context)
          Expanded(
            flex: 4,
            child: _buildQrView(context),
          ),
          //Container que contiene un titulo y el resultado del escaneo:
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Carnet escaneado: ",
                    style: TextStyle(
                      color: kFontPrimaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    isUrl ? _dataUrl : "Por favor escanea un carnet",
                    //"https://www.runtastic.com/blog/es/reto-de-28-dias-entrenando-en-casa-para-principiantes/ https://www.runtastic.com/blog/es/reto-de-28-dias-entrenando-en-casa-para-principiantes/",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: kFontPrimaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                ],
              ),
            ),
          ),
          //Boton Ancho: con formato condicional a que si es un URL
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
              onPressed: isUrl
                  ? () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(
                            url: _dataUrl,
                            //url: "https://carnetvacunacion.minsa.gob.pe/#publico/certificado/index?Tk=v3-J4cMCIPqW7QWLX5wFJPZiZTc637whHDP5NcoPhJXKxU=",
                          ),
                        ),
                      );
                    }
                  : null,
              child: const Text(
                "Registrar carnet",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12.0),
        ],
      ),
    );
  }
}
