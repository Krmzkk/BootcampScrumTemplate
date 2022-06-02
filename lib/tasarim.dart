import 'package:flutter/material.dart';

class Tasarim extends StatelessWidget {
  
  final String buttonText;
  final buttontapped;
  final color;
  final textColor;
 

  Tasarim(
  {this.color, this.textColor, this.buttonText = '', this.buttontapped});

  @override
  Widget build(BuildContext context) {
  return GestureDetector(
  onTap: buttontapped,
  
  child: Padding(      padding: EdgeInsets.all(5),
  child: ClipRRect(
  borderRadius: BorderRadius.circular(25), child: Container(
  color: color,
  child: Center(     child: Text(
  buttonText, style: TextStyle(
  color: textColor,
  fontSize: 20,
  fontWeight: FontWeight.bold,    ),    ),     ),   )   ),  ), ); } }
