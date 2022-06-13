import 'dart:io';

import 'package:firebase_demo/sub/chat.dart';
import 'package:firebase_demo/sub/new_feed.dart';
import 'package:firebase_demo/sub/setting.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int btnNavIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          title: const Text('ChatBase'),
          actions:  [Padding(padding: const EdgeInsets.only(right: 15),child: IconButton(icon: const Icon(Icons.notifications_active_rounded),onPressed: (){},),)],
      ),
      body: getBtnNavIndex(btnNavIndex),
      drawer: buildDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label:'New Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.chat),label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: 'Setting')
        ],
        currentIndex: btnNavIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
            setState(() {
              btnNavIndex=index;
            });
        }
      ),
    );
  }

  Widget getBtnNavIndex(btnNavIndex){
      switch (btnNavIndex) {
        case 0:
          return const NewFeed();
        case 1:
          return const Chat();
        case 2:
          return const Setting();
        default:
        return const Text("Other");
      }
    }
  
  Widget buildDrawer() {
  return Drawer(
      child: ListView(
    children: [
      const DrawerHeader(
        padding: EdgeInsets.fromLTRB(0, 32, 0, 0),
        child: ListTile(
          leading: Icon(Icons.account_circle,size: 80,),
          title: Text('Vorn Rathanak',),
          trailing: Icon(Icons.navigate_next_outlined),
          subtitle: Text('CEO & Founder'),
        ),
      ),
      Column(
        children: [
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('New Feed'),
            trailing: const Icon(Icons.navigate_next_outlined),
            onTap: (){
              setState(() {
                btnNavIndex=0;
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text('Chat'),
            trailing: const Icon(Icons.navigate_next_outlined),
            onTap: (){
              setState(() {
                btnNavIndex=1;
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Setting'),
            trailing: const Icon(Icons.navigate_next_outlined),
            onTap: (){
              setState(() {
                btnNavIndex=2;
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Exit'),
            trailing: const Icon(Icons.navigate_next_outlined),
            onTap: (){
              setState(() {
                showWarnMsg();
              });
            },
          ),
        ],
      )
    ],
  ));
}
  
  showWarnMsg(){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title:Row(children: [Icon(Icons.warning_amber_outlined,color: Colors.yellow[600],),const SizedBox(width: 10,),const Text('Warning')]),
          content: const Text('You are about to exit the application\nAre you sure?'),
          actions: [
            TextButton(child: const Text('YES'),onPressed: (){exit(0);},),
            TextButton(onPressed: (){Navigator.pop(context);}, child: const Text('NO'))
          ],
        );
      }
    );
  }
}