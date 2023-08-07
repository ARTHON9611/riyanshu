import 'package:flutter/material.dart';
import 'package:video_call_app/utils/colors.dart';
import 'package:video_call_app/widgets/home_screen_buttons.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _page=0;
  onPageChanged(int Page){
    setState(() {
      _page=Page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("Meet & Chat"),centerTitle: true,backgroundColor: backgroundColor,elevation: 0,),


    body: Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
        homeButton(onPress: (){}, icon: Icons.videocam, text: "New Meeting",butColor: Colors.deepOrange,),
        homeButton(onPress: (){}, icon: Icons.add_box_rounded, text: "Join Meeting",butColor: buttonColor,),
        homeButton(onPress: (){}, icon: Icons.calendar_today, text: "Schedule",butColor: buttonColor),
        homeButton(onPress: (){}, icon: Icons.arrow_upward_outlined, text: "Share Screen",butColor: buttonColor)],),


        const Expanded(child: Center(child: Text("Have fun with Friends!!!",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),)),)
      ],
    ),
      
    bottomNavigationBar: BottomNavigationBar(backgroundColor: footerColor,
    onTap: onPageChanged,
    currentIndex: _page,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey,
    showUnselectedLabels: true,
    unselectedLabelStyle: TextStyle(color: Colors.grey),
    items: const [BottomNavigationBarItem(icon: Icon(Icons.comment_bank),label: "Meet & Chat"),
    BottomNavigationBarItem(icon: Icon(Icons.lock_clock),label: "Meetings"),
    BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: "Contacts"),
    BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),label: "Settings"),
    BottomNavigationBarItem(icon: Icon(Icons.history),label: "History"),
    ]),);
  }
}