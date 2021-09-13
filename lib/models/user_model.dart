import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String id;
  String name;

  //contoh data json object nya
//     "data": {
//         "id": 2,
//         "email": "janet.weaver@reqres.in",
//         "first_name": "Janet",
//         "last_name": "Weaver",
//         "avatar": "https://reqres.in/img/faces/2-image.jpg"
//     },
//     "support": {
//         "url": "https://reqres.in/#support-heading",
//         "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
//     }
// }

  //buat construkcornya
  User({this.id, this.name});

  // buat factory method
  factory User.createUser(Map<String, dynamic> object) {
    return User(
        //string id di ambil dari json objek dengan key
        id: object['id']
            .toString(), //karena value json objectnya int maka harus di ubah ke string sesuai kebutuhan koding
        name: object['first_name'] + " " + object['last_name']);
  }

  static Future<User> connectToApi(String id) async {
    var apiURL = Uri.parse("https://reqres.in/api/users/" + id);
    var apiResult = await http.get(apiURL);
    var jsonObject =
        json.decode(apiResult.body); //yang di dapatkan adalah data dan support

    //kita ambil nilai dari data
    var userData = (jsonObject as Map<String, dynamic>)['data'];

    //taruh nilai dari jsonobject ke create user yang factory method
    return User.createUser(userData);
  }
}
