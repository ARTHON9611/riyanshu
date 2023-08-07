import 'package:flutter/material.dart';

class homeButton extends StatelessWidget {
  final VoidCallback onPress;
  final  IconData icon;
  final Color butColor;
  final String text;
  const homeButton({super.key,required this.onPress,required this.icon,required this.text,required this.butColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onPress,
    child: Column(
      children: [
        Container(decoration: BoxDecoration(color: butColor,borderRadius: BorderRadius.circular(16),boxShadow: [BoxShadow(blurRadius: 10,offset: Offset(0,4),color: Colors.black.withOpacity(0.06),
        )]),
        width: 60,
        height: 60,
        child: Icon(icon,size: 30,),
        
        ),
        SizedBox(height: 10,),
        Text(text,style: TextStyle(color: Colors.grey),)
      ],
    ),);
  }
}