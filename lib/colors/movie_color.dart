import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MovieColor  extends ChangeNotifier {
  // ignore: unrelated_type_equality_checks
  bool mode = true;
  HexColor purple =  HexColor('#4b1d97');
  HexColor yellow = HexColor('#ebcc1b');
  Color red = Colors.red;
  HexColor black = HexColor('#000000');

  switchMode(){
     if(mode == true) {
       purple = HexColor('#4b1d97');
       yellow = HexColor('#ebcc1b');
       red = Colors.red;
       black = HexColor('#000000');
       mode = false;
     } else {
       purple = HexColor('#f1ee09');
       yellow = HexColor('#ebcc1b');
       red = Colors.red;
       black = HexColor('#000000');
       mode = true;
    }
   }
}