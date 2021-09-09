import 'dart:convert';

import 'package:http/http.dart' as http;

class PostResult {
  // sesuaikan dengan data yang dikirimkan api
  String id;
  String name;
  String job;
  String created;

//constructor
  PostResult({this.id, this.name, this.job, this.created});

  //factory method
  //membuat object dari postresult
  //hasil dari mapping jsonobject
  factory PostResult.createPostResult(Map<String, dynamic> object) {
    // return object post result yang baru
    return PostResult(
        id: object['id'],
        name: object['name'],
        job: object['job'],
        created: object['createdAt']);
  }

  //method untuk menghubungkan aplikasi ke api
  static Future<PostResult> connectToAPI(String name, String job) async {
    var apiURL = Uri.parse("https://reqres.in/api/users");
    var apiResult = await http.post(apiURL, body: {"name": name, "job": job});

    //ambil bentuk json dari var apiResult
    //import dart convert
    var jsonObject = json.decode(apiResult.body);

    //jika sudah diubah ke jsonObjer
    return PostResult.createPostResult(jsonObject);
  }
}
