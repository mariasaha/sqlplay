import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlplay/models/user.dart';
import 'package:sqlplay/utils/database_helper.dart';

List _users;
//int _count;
void main() async {
  var db = DatabaseHelper();

  //add user
  //await db.saveUser(User("Robert", "robertpassword"));
  //print("User saved $saveduser");

  //get all users
  _users = await db.getAllUsers();
  //_count = await db.getCount();
  //User maria = await db.getUser(2);
  //int count = await db.getCount();

  for (int i = 0; i < _users.length; i++) {
    User user = User.map(_users[i]);
    print("Username: ${user.username}");
  }

  //print("Count: $_count");
  //print("User with ID #2 = ${maria.username}");

  runApp(MaterialApp(
    title: 'Database',
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Database"),
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
        ),
        body: ListView.builder(
          itemCount: _users.length,
          itemBuilder: (_, int position) {
            return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(
                      "${User.fromMap(_users[position]).username.substring(0, 1)}"),
                ),
                title: Text("User: ${User.fromMap(_users[position]).username}"),
                subtitle: Text("Id: ${User.fromMap(_users[position]).id}"),
                onTap: () =>
                    debugPrint("${User.fromMap(_users[position]).password}"),
              ),
            );
          },
        ));
  }
}
