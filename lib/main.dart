import 'package:flutter/material.dart';

import 'package:ddd/Acitivity/home.dart';

import 'package:ddd/Acitivity/loading.dart';
void main() {
  runApp(MaterialApp(
    routes: {
      "/" : (context) => Loading(),
      "/home" : (context) => Home(),
      "/loading" : (context) => Loading(),
    },
  
  ));
  }
