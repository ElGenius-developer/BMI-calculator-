import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi/mainMenu.dart' as mainMenu;

import 'actionMethods.dart';
import 'interpretation.dart';
int orSize =30;

class Result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 30, 1),
      appBar: AppBar(
          title: Text(
            "Bmi Calculator",
            textAlign: TextAlign.center,
          ),
          elevation: 12,
          backgroundColor: Color.fromRGBO(0, 0, 30, 1)),
      body:OrientationBuilder(
        builder: (context, orientation){
          if(orientation == Orientation.portrait){
            return resultWidget(context);
          }else{ orSize =50;
            return Container(

                child: SizedBox(
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width -.5,
                    child:  ListView(

                      children: [
                        resultWidget(context),
                      ],
                    )


              ),
            );
          }
        },
      ),
    );
  }
}
Widget resultWidget(BuildContext context)
{
  return  Center(
    child: Container(
      height: MediaQuery.of(context).size.height / 1,
      width: MediaQuery.of(context).size.width - 25,

      // shape: RoundedRectangleBorder(
      // borderRadius: BorderRadius.circular(15.0),)
      child: Column(

        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 10,
              bottom: MediaQuery.of(context).size.height / 15,
            ),
            child: Text(
              "Your Result is :",
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),

          Container(

            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(15),
            ),
            width: MediaQuery.of(context).size.height / 1,
            height: MediaQuery.of(context).size.height * .56,
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 15,
                  bottom: MediaQuery.of(context).size.height / 15,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height / 20,

                      ),
                      child: Text(
                        "$ResultInEnglish",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 30,
                            color: Color.fromRGBO(0, 204, 102, 1)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height / orSize ,
                      ),
                      child: Text('${mainMenu.methods.calculateResult().toStringAsFixed(1)}',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 36,
                            color: Color.fromRGBO(250, 250, 250 , 1)),
                      ),),
                    Container(

                      child: FlatButton(
                           //WSS height:MediaQuery.of(context).size.height /25,
                        //minWidth: MediaQuery.of(context).size.width /15,
                        onPressed: () => {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => interpretation(),))
                      }, child: Text('interpretation',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize:35,
                            color: Color.fromRGBO(250, 250, 250 , 1)),
                      ),),
                    )




                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10)
          ,
          Container(
              height:MediaQuery.of(context).size.height * .08,
              width: MediaQuery.of(context).size.width -28,
              decoration: BoxDecoration(
                color: Colors.pink,
                //    borderRadius: BorderRadius.circular(9),
              ),

              child: RaisedButton(
                  color: Colors.pink,
                  //padding: EdgeInsets.all(15),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Re-Calculate",
                      style: TextStyle(

                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,

                      ),

                    ),

                  ),

                  onPressed:()=>Navigator.pop(context) )

          ),





          // Text("${methods.calculateResult()}",
          //   style: TextStyle(
          //       color: Colors.white
          //   ),)
        ],
      ),
    ),
  );
}
