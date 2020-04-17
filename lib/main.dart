import 'package:covidverify/components/generate.dart';

import 'package:covidverify/components/scan.dart';
import 'package:covidverify/components/verify.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
        debugShowCheckedModeBanner: false,
      home: FirstPage()

    );
  }
}








class FirstPage extends StatefulWidget {






  @override
  _FirstPage  createState() => _FirstPage ();
}

class _FirstPage  extends State<FirstPage > {
  Size size;
  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;




    return
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          //leading: Icon(Icons.menu),
//          actions: <Widget>[
//            //IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
//            IconButton(icon: Icon(Icons.info), onPressed: () {})
//          ],
          title: Text(
            "Covid-19 Test Verifier",
            textAlign: TextAlign.center,
            style: new TextStyle( fontWeight: FontWeight.bold,
                fontSize: 20.0, color: Colors.black),
          ),
        ),


        body: Stack(

          children: <Widget>[
            SingleChildScrollView(
              child: Container(

                margin:EdgeInsets.all(8.0),
                child: Container(
                  //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Image.asset(
                              'assets/covid.jpg',
                              width: 400,
                              height: 250,
                              fit:BoxFit.fill

                          ),
                        ),
                        Column(

                          children: <Widget>[
                            HomeScreenTopPart(),
                            //HomeScreenMiddlePart(),
                            HomeScreenUnderPart(),



                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),







        backgroundColor: Colors.black,

      );








  }

}



class HomeScreenTopPart extends StatefulWidget {
  HomeScreenTopPart();



  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {


  @override
  List<String> images = [
    "assets/list.png",
    "assets/cart.png",

  ];

  List<String> titles = ["Scan Code", "Generate Code"];

  List<Widget> activity() {
    List<Widget> activityList = new List();

    for (int i = 0; i < 2; i++) {
      var activityitem = Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: SingleChildScrollView(
          child: Container(
            height: 150.0,
            width: 130.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.red,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 0.0,
                      offset: Offset(5.0, 1.0))
                ]),
            child: Column(
              children: <Widget>[
                //new GestureDetector(onTap: (){},),
                InkWell(
                  onTap: () {
                    if(i == 0){Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScanScreen()),
                    );

                    }else{Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GenerateScreen()),
                    );

                    }
                  },

                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                    child: Center(
                      child: Image.asset(
                        images[i],
                        width: 80,
                        height: 85.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0, left: 8.0, right: 8.0),
                  child: Text(titles[i],
                    textAlign: TextAlign.center,
                    style: new TextStyle( fontWeight: FontWeight.bold,
                        fontSize: 16.0, color: Colors.black),),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3.0),
                )
              ],
            ),
          ),
        ),
      );
      activityList.add(activityitem);
    }
    return activityList;
  }
  @override
  Widget build(BuildContext context) {
    return new Container(
        height: 200.0,
        margin: EdgeInsets.only(left: 33.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 200.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: activity(),
                  //new GestureDetector(onTap: (){}
                ),

              ),


            ]
        )
    );





  }
}







class HomeScreenUnderPart extends StatefulWidget {
  HomeScreenUnderPart();



  @override
  _HomeScreenUnderPartState createState() => _HomeScreenUnderPartState();
}

class _HomeScreenUnderPartState extends State<HomeScreenUnderPart> {


  @override
  List<String> images = [
    "assets/manual.png",
    "assets/cash.png",

  ];

  List<String> titles = ["Enter/Verify Details", "Verify"];

  List<Widget> activity() {
    List<Widget> activityList = new List();

    for (int i = 0; i < 1; i++) {
      var activityitem = Padding(
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
        child: SingleChildScrollView(
          child: Container(
            height: 150.0,
            width: 280.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.red,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 0.0,
                      offset: Offset(5.0, 5.0))
                ]),
            child: Column(
              children: <Widget>[
                //new GestureDetector(onTap: (){},),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Tabs()),
                    );
                  },

                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0)),

                    child: Center(
                      child: Image.asset(
                        images[i],
                        width: 80,
                        height: 80.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0, left: 8.0, right: 8.0),
                  child: Text(titles[i],
                    textAlign: TextAlign.center,
                    style: new TextStyle( fontWeight: FontWeight.bold,
                        fontSize: 16.0, color: Colors.black),),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3.0),
                )
              ],
            ),
          ),
        ),
      );
      activityList.add(activityitem);
    }
    return activityList;
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: new Container(
        //height: 100.0,
          margin: EdgeInsets.only(left: 33.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 200.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: activity(),
                    //new GestureDetector(onTap: (){}
                  ),

                ),


              ]
          )
      ),
    );





  }


  Future buildShowDialogBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text(" PAYMENT STEPS \n \n 1.Go to mpesa \n 2.Select Lipa na Mpesa \n 3.select Buy goods & services \n 4.Enter till number Provided via text \n 5.Enter amount \n 6.Enter your Mpesa pin to complete transaction", style: GoogleFonts.tinos(
              fontSize: 25.0,
              fontWeight: FontWeight.w500,
              color: Colors.black
          ))


          ),
          content: Container(
            height: 50,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[


              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {

                Navigator.of(context).pop();
              },
              child: Text("Close", style: TextStyle(color: Colors.black,fontSize: 22)),
            )
          ],
          backgroundColor: Colors.green,
        );
      },

    );
  }

}