import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:faker_generator/models/user_model.dart';
import 'package:faker_generator/services/functions.dart';
import 'package:faker_generator/services/lists.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel _userModel;
  Functions _fn;
  Lists _ls;
  String word = "";
  List<String> words = [];

  @override
  void initState() {
    _userModel = UserModel();
    _fn = Functions();
    _ls = Lists();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(12),
        child: ListView(
          children: [
            //! Create name
            FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString("assets/data/names.json"),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  var myData = json.decode(snapshot.data.toString());
                  var rand = Random().nextInt(1);
                  var gender = rand == 0 ? "men" : "women";

                  _userModel.name = Name(
                    firstName: myData[gender][Random().nextInt(1000)],
                    lastName: myData["surname"][Random().nextInt(10000)],
                  );

                  var dob = DateTime.now();

                  _userModel.dob = "${dob.year}-${dob.month}-${dob.day}";
                  _userModel.avatar = _fn.avatar(gender);
                  _userModel.phoneNumber = _fn.phoneNumber();

                  return Text("data");
                } else {
                  return Text("No data");
                }
              },
            ),
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  child: Image.network(
                    _fn.avatar('women'),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text("Phone: " + _fn.phoneNumber()),
            SizedBox(height: 12),
            Text("Age: " + _fn.age().toString()),
            SizedBox(height: 12),
            Text(
              "Ethincity: " +
                  _ls.ethnicity[Random().nextInt(_ls.ethnicity.length)],
            ),
            SizedBox(height: 12),
            Text(
              "Looking For: " +
                  _ls.lookingFor[Random().nextInt(_ls.lookingFor.length)],
            ),
            SizedBox(height: 12),
            Text(
              "Education: " +
                  _ls.education[Random().nextInt(_ls.education.length)],
            ),
            SizedBox(height: 12),
            Text(
              "Religion: " +
                  _ls.religion[0][Random().nextInt(_ls.religion[0].length)] +
                  " - " +
                  _ls.religion[1][Random().nextInt(_ls.religion[1].length)],
            ),
            SizedBox(height: 12),
            Text(
              "Sign: " + _ls.sign[Random().nextInt(_ls.sign.length)],
            ),
            SizedBox(height: 12),
            Text(
              "Politics: " +
                  _ls.politics[Random().nextInt(_ls.politics.length)],
            ),
            SizedBox(height: 12),
            Text(
              "Sexuality:\n" +
                  "\t\t\tLooking for: " +
                  _ls.sexuality[0][Random().nextInt(_ls.sexuality[0].length)] +
                  "\n" +
                  "\t\t\tOrientation: " +
                  _ls.sexuality[1][Random().nextInt(_ls.sexuality[1].length)] +
                  "\n" +
                  "\t\t\tType: " +
                  _ls.sexuality[2][Random().nextInt(_ls.sexuality[2].length)],
            ),
            SizedBox(height: 12),
            Text(
              "Other:\n" +
                  "\t\t\tDiet: " +
                  _ls.detail[0][Random().nextInt(_ls.detail[0].length)] +
                  "\n" +
                  "\t\t\tSmoking: " +
                  _ls.detail[1][Random().nextInt(_ls.detail[1].length)] +
                  "\n" +
                  "\t\t\tDrinking: " +
                  _ls.detail[2][Random().nextInt(_ls.detail[2].length)],
            ),
            SizedBox(height: 12),
            Text(
              "Kids: " +
                  _ls.kids[0][Random().nextInt(_ls.kids[0].length)] +
                  " - " +
                  _ls.kids[1][Random().nextInt(_ls.kids[1].length)],
            ),
            SizedBox(height: 12),
            Text(
              "Pets: " + _ls.pets[Random().nextInt(_ls.pets.length)],
            ),
            SizedBox(height: 12),
            FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString("assets/data/words.json"),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  var myData = json.decode(snapshot.data.toString());
                  var rand = 2 + Random().nextInt(370100 - 2);

                  print(snapshot.data);

                  rand = rand.toString().length > 3
                      ? rand
                      : 2 + Random().nextInt(370100 - 2);

                  return Text(
                      "Email: " + myData["words"][rand] + "@example.com");
                } else {
                  return Text("No data");
                }
              },
            ),
            RaisedButton(
              onPressed: () async {},
              child: Text("data"),
            ),
          ],
        ),
      ),
    );
  }
}
