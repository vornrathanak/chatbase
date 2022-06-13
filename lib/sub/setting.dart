import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'User Profile',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 20),
                CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: const Icon(
                    Icons.account_balance,
                    size: 60,
                  ),
                  radius: 50,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Vorn Rathank',
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 1,
                  ),
                ),
                const Divider(
                  height: 30,
                  thickness: 1,
                  indent: 30,
                  endIndent: 30,
                ),
                const Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: ListTile(
                    title: Text('Vorn Rathanak'),
                    leading: Icon(Icons.people),
                    trailing: Icon(Icons.edit),
                  ),
                ),
                const SizedBox(height: 5),
                const Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: ListTile(
                    title: Text('vornrathanak7366@gmail.com'),
                    leading: Icon(Icons.email),
                    trailing: Icon(Icons.edit),
                  ),
                ),
                const SizedBox(height: 5),
                const Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: ListTile(
                    title: Text('********'),
                    leading: Icon(Icons.security),
                    trailing: Icon(Icons.edit),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: (){},
                  icon: const Icon(Icons.login_outlined),
                  label: const Text('Log Out'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    primary: Colors.blue[400],
                    minimumSize: const Size.fromHeight(50),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
