import 'package:bmi/actionMethods.dart';
import 'package:bmi/main.dart';
import 'package:bmi/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color colorMen = Color.fromRGBO(30, 30, 60, 1);
Color colorWoMen = Color.fromRGBO(30, 30, 60, 1);
var methods = new Operations(height: 175, weight: 75, age: 23, gender: 'male');
double ScrollContainerSizeDivider = 1;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bmi Calculator",
      color: Colors.red,
      home: MainMenu(
        title: "BMI Calculator",
      ),
    );
  }
}

class MainMenu extends StatefulWidget {
  final String title;

  MainMenu({this.title});

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
//double heigtRange=20 ;

  void increaseWeightCounter() {
    if (methods.weight < 250) {
      setState(() {
        methods.weight++;
      });
    }
  }

  void decreaseWeightCounter() {
    if (methods.weight > 0) {
      setState(() {
        methods.weight--;
      });
    }
  }

  void increaseAgeCounter() {
    setState(() {
      methods.age++;
    });
  }

  void decreaseAge() {
    setState(() {
      methods.age--;
    });
  }

  Widget mainWidget(BuildContext context) {
    return Center(
      child: Container(

        // padding: EdgeInsets.all(8),

        child: Column(
          //  mainAxisSize: MainAxisSize.max,

          children: [
            SizedBox(
              height: 40,
            ),
            //first row contain male and female
            FittedBox(
              child: Center(
                child: Row(
                  children: [
                    // SizedBox(height: 10,width: 10,),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          width: 160,
                          height: 130,
                          decoration: BoxDecoration(
                            //color: Color.fromRGBO(30, 30,60 , 1),
                            color: colorMen,

                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: FlatButton(
                            autofocus: true,
                            splashColor: Color.fromRGBO(100, 100, 130, 1),
                            child: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(7)),
                                Icon(
                                  FontAwesomeIcons.mars,
                                  size: 60,
                                  color: Colors.white,
                                ),
                                Padding(padding: EdgeInsets.only(top: 10)),
                                Text(
                                  "Male",
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 16),
                                )
                              ],
                            ),
                            onPressed: () {
                              methods.type = setToMale();
                              setState(() {
                                colorMen = Colors.white30;
                                colorWoMen = Color.fromRGBO(30, 30, 60, 1);
                              });
                            },
                          )),
                    ),
                    // SizedBox(height: 10,width: 20,),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                          width: 160,
                          height: 130,
                          decoration: BoxDecoration(
                            color: colorWoMen,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: FlatButton(
                              autofocus: true,
                              splashColor: Color.fromRGBO(100, 100, 130, 1),
                              child: Column(
                                children: [
                                  Padding(padding: EdgeInsets.all(7)),
                                  Icon(
                                    FontAwesomeIcons.venus,
                                    size: 60,
                                    color: Colors.white,
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 10)),
                                  Text(
                                    "Female",
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 16),
                                  )
                                ],
                              ),
                              onPressed: () {
                                methods.type = setToFemale();
                                setState(() {
                                  colorMen = Color.fromRGBO(30, 30, 60, 1);
                                  colorWoMen = Colors.white30;
                                });
                              })),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10),
            //Second Row Contain Height , Scroll bar **
            Center(
              child: Container(
                // padding: const EdgeInsets.only(left:10.0,right: 10),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    //  padding: EdgeInsets.only(l10),
                    // width: 350,
                    // height: 150,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(30, 30, 60, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),

                    child: Container(
                      width: MediaQuery.of(context).size.width /
                          ScrollContainerSizeDivider,
                      child: Column(children: [
                        Text(
                          "Height",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, color: Colors.white30),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "  ${methods.height.round()}",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                              ),
                            ),
                            Text(
                              "\n\n"
                                  "cm",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.white30,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        Center(
                          heightFactor: 1,
                          child: Slider(
                            value: methods.height.toDouble(),
                            min: 50,
                            max: 250,
                            divisions: 250,
                            activeColor: Colors.pink,
                            label: methods.height.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                methods.height = value.round();
                              });
                            },
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //Third row
            FittedBox(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    //  SizedBox(width: 1,),

                    // Padding(padding: EdgeInsets.all(5)),
                    Container(
                      height: 130,
                      width: 160,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(30, 30, 60, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      //Weight Column
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Weight',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 17,
                                  height: 2),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${methods.weight}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  height: 1.3,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            //mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Expanded(
                                child: FlatButton(
                                  child: Container(
                                    height: 35,
                                    width: 40,
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white30,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () => {
                                    decreaseWeightCounter(),
                                  },
                                ),
                              ),
                              Expanded(
                                child: FlatButton(
                                  child: Container(
                                    height: 35,
                                    width: 40,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white30,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () => {
                                    increaseWeightCounter(),
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                    Padding(padding: EdgeInsets.all(10)),
                    Container(
                      height: 130,
                      width: 160,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(30, 30, 60, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Age',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 17,
                                  height: 2),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${methods.age}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  height: 1.3,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: FlatButton(
                                    child: Container(
                                      height: 35,
                                      width: 40,
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white30,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onPressed: () => {
                                      if (methods.age > 0) {decreaseAge()}
                                    }),
                              ),
                              Expanded(
                                child: FlatButton(
                                    child: Container(
                                      height: 35,
                                      width: 40,
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white30,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onPressed: () => {
                                      if (methods.age < 200)
                                        {
                                          increaseAgeCounter(),
                                        }
                                    }),
                              ),
                            ],
                          )
                        ],
                      ),
                      //NiceButton(onPressed: ()=> {print('asd') }, text: "null",
                      //),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FlatButton(
              onPressed: () => {
                methods.Calc(),
                print(methods.calculateResult().round()),
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Result(),
                    ))
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(15),
                ),

                height: MediaQuery.of(context).size.height * .09,
                width: MediaQuery.of(context).size.width / 1,
                //padding: EdgeInsets.all(15),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Calculate",

                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      //  height: 3,
                        fontSize: 22,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 30, 1),
      appBar: AppBar(
          title: Text(
            "${widget.title}",
            textAlign: TextAlign.center,
          ),
          elevation: 12,
          backgroundColor: Color.fromRGBO(0, 0, 30, 1)),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            ScrollContainerSizeDivider=1;
            return mainWidget(context);
          } else {
            ScrollContainerSizeDivider =2.2;
            return Container(

              child: SizedBox(


                  child: ListView(
                    children: [
                      mainWidget(context),
                    ],
                  )),
            );
          }
        },
      ),
    );
  }
}
