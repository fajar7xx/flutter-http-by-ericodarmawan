import 'package:flutter/material.dart';
import 'package:flutter_http/models/post_result_model.dart';

void main() => runApp(MyApp());

// gunakan statefull widget kalau update tampilan
class MyApp extends StatefulWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  // const MainPage({ Key? key }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PostResult postResult = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // Text("Hasil Response"),
            Text((postResult != null)
                ? postResult.id +
                    " | " +
                    postResult.name +
                    " | " +
                    postResult.job +
                    " | " +
                    postResult.created
                : "Tidak ada data"),
            // RaisedButton(
            //   onPressed: () {},
            //   child: Text("Submit & Post"),
            // ),
            ElevatedButton(
              onPressed: () {
                //panggil
                PostResult.connectToAPI("Fajar", "Pegawai").then((value) {
                  postResult = value;
                  setState(() {});
                });
              },
              child: Text("Submit & Post"),
            )
          ],
        ),
      ),
    );
  }
}
