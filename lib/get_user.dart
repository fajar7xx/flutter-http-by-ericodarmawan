import 'package:flutter/material.dart';
import 'package:flutter_http/models/user_model.dart';

void main() => runApp(GetUser());

class GetUser extends StatefulWidget {
  // const GetUser({ Key? key }) : super(key: key);

  @override
  _GetUserState createState() => _GetUserState();
}

class _GetUserState extends State<GetUser> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: UserDetailPage());
  }
}

class UserDetailPage extends StatefulWidget {
  // const UserDetailPage({ Key? key }) : super(key: key);

  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  User user = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Api Demo get user detail"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text((user != null)
                  ? user.id + " | " + user.name
                  : "Tidak ada data"),
              ElevatedButton(
                  onPressed: () {
                    User.connectToApi("6").then((value) {
                      user = value;
                      setState(() {});
                    });
                  },
                  child: Text("Get User Detail"))
            ],
          ),
        ));
  }
}
