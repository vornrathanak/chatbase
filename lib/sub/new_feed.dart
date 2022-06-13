import 'package:flutter/material.dart';

class NewFeed extends StatefulWidget {
  const NewFeed({ Key? key }) : super(key: key);

  @override
  State<NewFeed> createState() => _NewFeedState();
}

class _NewFeedState extends State<NewFeed> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: 
            [Column(
              children: [
                newFeed(filepath:'images/dog.jpg',user: 'Vorn Rathanak',duration: '1h ago',title: 'Sample sample sample'),
                newFeed(filepath:'images/dog.jpg',user: 'Romeo Osaka',duration: '2h ago',title: 'Sample sample sample'),
                newFeed(filepath:'images/dog.jpg',user: 'Marida Keo',duration: '20mn ago',title: 'Sample sample sample'),
                newFeed(filepath:'images/dog.jpg',user: 'Thor',duration: '1h ago',title: 'Sample sample sample'),
                newFeed(filepath:'images/dog.jpg',user: 'Manderin',duration: '5mn ago',title: 'Sample sample sample'),
              ],
            ),
          ],
        )
      )
    );
  }
Widget newFeed({String filepath='',String user='',String duration='',String title=''}){
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: ClipRRect(
                                child: Image.asset(filepath,width: 50,),
                                borderRadius: BorderRadius.circular(50.0),
      ),
),
                title: Text(user),
                trailing: IconButton(onPressed: (){},icon: const Icon(Icons.more_horiz_outlined),),
                subtitle: Text(duration),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5,bottom: 5),
                child: Text(title),
              ),
              Container(
                width: double.maxFinite,
                height: 180,
                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Color.fromARGB(255, 48, 48, 48),),
                child: ClipRRect(child: Image.asset(filepath),borderRadius: const BorderRadius.all(Radius.circular(20)),)
              ),
              Padding(padding: const EdgeInsets.only(top: 5,bottom: 5),
                child: Row(
                  children: [
                    Expanded(flex: 2,child: Row(children: const [Icon(Icons.favorite_border_outlined,color: Color.fromARGB(255, 2, 0, 117),size: 30,),SizedBox(width: 3),
                    Text('900K')],)),
                    Expanded(flex: 2,child: Row(children: const [Icon(Icons.comment,color: Color.fromARGB(255, 2, 0, 117),size: 30,),SizedBox(width: 3),
                    Text('900K')],)),
                    Expanded(child: Row(children: const [Icon(Icons.share,color: Color.fromARGB(255, 2, 0, 117),size: 30,),SizedBox(width: 3),
                    Text('900K')],)),
                  ],
                )
                )
            ],
          ),
    ),
  );
}
}