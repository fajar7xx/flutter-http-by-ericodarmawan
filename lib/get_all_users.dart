import 'package:flutter/material.dart';
import 'package:flutter_http/models/users_model.dart';

void main() => runApp(GetAllUsers());

class GetAllUsers extends StatefulWidget {
  // const GetAllUsers({ Key? key }) : super(key: key);

  @override
  _GetAllUsersState createState() => _GetAllUsersState();
}

class _GetAllUsersState extends State<GetAllUsers> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UsersPage(),
    );
  }
}

class UsersPage extends StatefulWidget {
  // const UsersPage({ Key? key }) : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  String output = "no data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Get All Users"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(output),
              ElevatedButton(
                  onPressed: () {
                    Users.getUsers("2").then((users) {
                      output = "";
                      for (int i = 0; i < users.length; i++) {
                        output = output + "[ " + users[i].name + " ] ";
                        setState(() {});
                      }
                    });
                  },
                  child: Text("Get All Data"))
            ],
          ),
        ));
  }
}
