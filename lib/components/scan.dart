import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanState createState() => new _ScanState();
}

class _ScanState extends State<ScanScreen> {
  String barcode = "";

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.red,
          title: new Text('Covid Test verify Scanner',style: new TextStyle( fontWeight: FontWeight.bold,
              fontSize: 16.0, color: Colors.black),),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: RaisedButton(
                    color: Colors.red,
                    textColor: Colors.black,
                    splashColor: Colors.blueGrey,
                    onPressed: scan,
                    child: const Text(' SCAN')
                ),
              )
              ,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(barcode, textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),

              ),
              SizedBox(height: 30),
              Builder(builder: (context) {
                return InkWell(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: barcode));
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Text copied successfully")));
                    },
                    child: Text("COPY THIS",
                        style: TextStyle(color: Colors.red)));
              }),

            ],
          ),
        ),
        backgroundColor: Colors.black,
    );
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException{
      setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}