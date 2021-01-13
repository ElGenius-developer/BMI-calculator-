import 'package:bmi/mainMenu.dart';
import 'package:bmi/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'actionMethods.dart';
double average=0.0;
// ignore: camel_case_types
class interpretation extends Result {
  void setAverage(){
  if(methods.age<8 && methods.age>0 )
  {
  average=15.9;
}
else if(methods.age>=10 && methods.age<=14 ){
if(methods.type.toLowerCase()=='male')
average=17.84;
else if(methods.type.toLowerCase()=='female')
average=18.31;

}
else if(methods.age>=16 && methods.age<=18 ){
if(methods.type.toLowerCase()=='male')
average=21.74;
else if(methods.type.toLowerCase()=='female')
average=20.5;

}
else if(methods.age>18)
    average=21.75;

  }


  @override
  Widget build(BuildContext context) {
setAverage();



    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Bmi interpretation",
            textAlign: TextAlign.center,
          ),
          elevation: 12,
          backgroundColor: Color.fromRGBO(0, 0, 30, 1)),
      backgroundColor: Color.fromRGBO(0, 0, 30, 1),
      body:  OrientationBuilder(
        builder: (context, orientation){
          if(orientation == Orientation.portrait){
            return ScreenInterper(context);
          }else{
            return Center(
              child: SizedBox(
                height: double.infinity,
                width: MediaQuery.of(context).size.width *.5,
                child:  ListView(

                  children: [
                    ScreenInterper(context),
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
Widget ScreenInterper(BuildContext context){
  return Center(
    child: Container(

        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(15),
        ),
        width: MediaQuery.of(context).size.width - 50,
        height: MediaQuery.of(context).size.height * .7,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Text(
                "the approximate average for you is : ",
                maxLines: 3,
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Text(
              "$average",
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(0, 204, 102, 1),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            Text( " BMI Formula: " ,
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(250, 54, 52, 1),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            Image(image: AssetImage('assets/equ.png'),
            ),

          ],
        )),
  );
}