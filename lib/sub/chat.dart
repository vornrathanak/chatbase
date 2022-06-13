import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({ Key? key }) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              itemsCard(filePath: 'images/dog.jpg',user: 'Vorn Rathanak',isOnline: false),
              itemsCard(filePath: 'images/dog.jpg',user: 'Monika Jane',isOnline: true),
              itemsCard(filePath: 'images/dog.jpg',user: 'Sony Ka',isOnline: false),
              itemsCard(filePath: 'images/dog.jpg',user: 'Robin Son',isOnline: true),
              itemsCard(filePath: 'images/dog.jpg',user: 'Andreal',isOnline: true),
              itemsCard(filePath: 'images/dog.jpg',user: 'Rosee Ka',isOnline: false),
              itemsCard(filePath: 'images/dog.jpg',user: 'Mario',isOnline: true),
              itemsCard(filePath: 'images/dog.jpg',user: 'Attika',isOnline: true),
              itemsCard(filePath: 'images/dog.jpg',user: 'Flutter Dev',isOnline: false),
              itemsCard(filePath: 'images/dog.jpg',user: 'Stack Over Flow',isOnline: true),
            ],
          ),
        )
      ),
    );
  }

  Widget itemsCard({String filePath='',String user='',bool isOnline=true}){
    return SizedBox(
      width: double.maxFinite,
      child:Card(
        elevation: 1,
        color:const Color.fromARGB(255, 255, 255, 255),
        child: ListTile(
          title: Text(user),
          subtitle: Text(isOnline?'Online':'Offline'),
          trailing: isOnline?const Icon(Icons.circle_notifications,color: Colors.blue,):const Icon(Icons.circle_notifications,color: Colors.red,),
          leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: ClipRRect(
                              child: Image.asset('images/dog.jpg',width: 50,),
                              borderRadius: BorderRadius.circular(50.0),
    ),
),
)
)
      );
  }
}