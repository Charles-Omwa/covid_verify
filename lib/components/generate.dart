import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';

import 'detail.dart';

class GenerateScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => GenerateScreenState();
}

class GenerateScreenState extends State<GenerateScreen> {

  static const double _topSectionTopPadding = 50.0;
  static const double _topSectionBottomPadding = 20.0;
  static const double _topSectionHeight = 50.0;

  GlobalKey globalKey = new GlobalKey();
  String _dataString = "Hello from this QR";
  String _inputErrorText;
  final TextEditingController _textController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailWidget ( )),
              );


            },
          )

        ],
        title: Text(' QR ID generator',style: new TextStyle( fontWeight: FontWeight.bold,
            fontSize: 16.0, color: Colors.black),),
      ),
      body: _contentWidget(),

    );
  }



  _contentWidget() {
    final bodyHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).viewInsets.bottom;
    return  Container(
      color: Colors.black,
      child:  Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: _topSectionTopPadding,
              left: 20.0,
              right: 10.0,
              bottom: _topSectionBottomPadding,
            ),
            child:  Container(
              height: _topSectionHeight,
              child:  Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child:  TextField(style: new TextStyle(color: Colors.white),

                      controller: _textController,
                      decoration:  InputDecoration(

                        hintText: "Enter the encrypted info",
                        hintStyle: new TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 16.0, color: Colors.red),
                        errorText: _inputErrorText,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),



                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child:  FlatButton(
                      child:  Text("GENERATE",style: new TextStyle( fontWeight: FontWeight.bold,
                          fontSize: 16.0, color: Colors.red),),
                      onPressed: () {
                        setState((){
                          _dataString = _textController.text;
                          _inputErrorText = null;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child:  Center(
              child: RepaintBoundary(
                key: globalKey,
                child: QrImage(backgroundColor: Colors.white,
                  data: _dataString,
                  size: 0.5 * bodyHeight,
//                  onError: (ex) {
//                    print("[QR] ERROR - $ex");
//                    setState((){
//                      _inputErrorText = "Error! Maybe your input value is too long?";
//                    });
//                  },
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}