import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/services.dart';


class Tabs extends StatefulWidget {
  const Tabs({Key key}): super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  String encryptedtext = "";
  String text="";
  String secret="";
  String decrypttext="";
  String secret1="";
  String textt="";
  String decryptedtext ="decrypted text";
  GlobalKey globalKey = new GlobalKey();
  //String _dataString = "Hello from this QR";
  String _inputErrorText;
  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      Padding(
        padding: const EdgeInsets.all(25),
        child: ListView(
            children: [
              SizedBox(height:60),
              TextField(style: new TextStyle(color: Colors.red),
                  onChanged: (val) {
                    text = val;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter ID No + Default input",
                    hintStyle: new TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 16.0, color: Colors.red),
                    errorText: _inputErrorText,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),

                  )),
              TextField(style: new TextStyle(color: Colors.red),
                  onChanged: (sl) {
                    secret = sl;
                  },
                  decoration:
                  InputDecoration(hintText: "Enter Secret key",
                    hintStyle: new TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 16.0, color: Colors.red),
                    errorText: _inputErrorText,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),


                  )),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () {
                  if (secret != null && secret.isNotEmpty) {
                    String secretadd= "sailasdjfklasjdhfljaskldjhflaksj";
                    final key = encrypt.Key.fromUtf8(secret+secretadd.substring(0,32-secret.length));
                    final iv = encrypt.IV.fromLength(16);
                    debugPrint("entered");
                    var enc = encrypt.Encrypter(encrypt.AES(key));
                    final encrypted = enc.encrypt(text, iv: iv);
                    debugPrint(encrypted.toString());
                    setState(() {
                      encryptedtext = encrypted.base64;
                    });
                  }
                },
                child: Text("Encrypt info",
                    style: TextStyle(color: Colors.black)),
                color: Colors.red,
              ),
              Text(encryptedtext,style: TextStyle(color: Colors.white)),
              SizedBox(height: 30),
              Builder(builder: (context) {
                return InkWell(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: encryptedtext));
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Text copied successfully")));
                    },
                    child: Text("COPY THIS",
                        style: TextStyle(color: Colors.red)));
              }),
              SizedBox(height: 30)
            ]),
      ),
      Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
            children: [
              SizedBox(height:60),
              TextField(style: TextStyle(color: Colors.red),
                onChanged: (val){
                  decrypttext=val;
                },
                decoration: InputDecoration(
                  hintText: "Enter the text",
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
              TextField(style: TextStyle(color: Colors.red),
                onChanged: (val){
                  secret1=val;
                },
                decoration:
                InputDecoration(hintText: "Enter the key to decrypt",

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
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () {
                  if (secret1.isNotEmpty) {
                    String secretadd= "sailasdjfklasjdhfljaskldjhflaksj";
                    final key = encrypt.Key.fromUtf8(secret1+secretadd.substring(0,32-secret1.length));
                    final iv = encrypt.IV.fromLength(16);
                    debugPrint("entered");
                    var enc = encrypt.Encrypter(encrypt.AES(key));
                    var d= enc.decrypt(encrypt.Encrypted.fromBase64(decrypttext),iv: iv );
                    debugPrint(d);
                    setState(() {
                      textt=d;
                    });
                  }
                },
                child: Text(
                  "Decrypt text",
                  style: TextStyle(color: Colors.black),
                ),
                color: Colors.red,
              ),
              Text(textt,style: TextStyle(color: Colors.white),)
            ]),
      )
    ];
    final _kTabs= <Tab> [
      Tab(icon: Icon(Icons.save_alt),text:'SAVE'),
      Tab(icon: Icon(Icons.verified_user),text:'VERIFY')
    ];
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("INFO",style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.red,
          bottom: TabBar(tabs: _kTabs),
        ),
        body: TabBarView(
          children: _kTabPages,
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}