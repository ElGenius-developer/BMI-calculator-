import 'package:flutter/material.dart';

String setToMale()=> 'Male'.toLowerCase();
String setToFemale()=>'Female'.toLowerCase();

// ignore: non_constant_identifier_names
  String ResultInEnglish='';
class Operations{
  int _height , _weight ,_age;
  String _type;
  double _resHeight;
  Operations({int height,int weight ,int age ,String gender ,}){
this._height=height;
this._weight=weight;
this._age=age;
this._type=gender;
  }


  get age => _age;

  set age(value) {
    _age = value;
  }

  int get height => _height;

  set height(int value) {
    _height = value;
  }

  get weight => _weight;

  set weight(value) {
    _weight = value;
  }

  String get type => _type;

  set type(String value) {
    _type = value;
  }
  double calculateResult( ){
     _resHeight =_height / 100;

    _resHeight = _weight / (_resHeight *_resHeight);
  return _resHeight;
  }
  void Calc( )
  {
    if(_age >=2 &&_age<=8  )
      {
        if(calculateResult() >= 15 && calculateResult() <= 16.5){
         // ResultInEnglish ='Normal';
          print(ResultInEnglish);

        }
        else if(calculateResult() < 15 ) {
          ResultInEnglish = 'Thin';
        }

    else if(calculateResult() > 16.5 )
      ResultInEnglish='Overweight';

  }
    else if(_age >=10 &&_age<=14 )
    {
    if(_type =='female')
      {
        if(calculateResult() >= 18.0 && calculateResult() <= 19){
          ResultInEnglish ='Normal';


        }
        else if(calculateResult() < 18 )
          ResultInEnglish='Thin';

        else if(calculateResult() > 19 )
          ResultInEnglish='Overweight';
      }
    else if(_type=='male')
        {
          if(calculateResult() > 16.7 && calculateResult() <= 18){
          ResultInEnglish ='Normal';


        }
        else if(calculateResult() <= 16.7 )
          ResultInEnglish='Thin';

        else if(calculateResult() > 18 )
          ResultInEnglish='Overweight';

        }
    }
    else if(_age >=16 &&_age<=18 ){

      if(calculateResult() >= 20.5 && calculateResult() <= 22){
        ResultInEnglish ='Normal';

      }
      else if(calculateResult() < 20.5 )
        ResultInEnglish='Thin';

      else if(calculateResult() > 22 )
        ResultInEnglish='Overweight';
    }
    else if(_age>18)
      {
        if(calculateResult()<16) {
        ResultInEnglish = 'Severe Thinness';

      } else  if(calculateResult() >= 16 &&calculateResult()<17)
          ResultInEnglish='Moderate Thinness';
        else  if(calculateResult() >= 17 &&calculateResult() < 18.5)
          ResultInEnglish='Mild Thinness';
        else  if(calculateResult() >= 18.5  &&calculateResult() < 25)
          ResultInEnglish='Normal';
        else  if(calculateResult() >= 25  &&calculateResult() < 30)
          ResultInEnglish='Overweight';
        else  if(calculateResult() >= 30  &&calculateResult() < 35)
          ResultInEnglish='Obese Class I';
        else  if(calculateResult() >= 35  &&calculateResult() < 40)
          ResultInEnglish='Obese Class II';
        else  if(calculateResult() > 40 )
          ResultInEnglish='Obese Class III';



      }

  else{
    print("Please Go to ActionMethods and check Function Of calc ");
  }
}
}
