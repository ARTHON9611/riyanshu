import 'package:flutter/material.dart';

showsnackBar(BuildContext context,String text){
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}