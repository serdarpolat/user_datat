import 'dart:convert';
import 'dart:math';

import 'package:faker_generator/models/user_model.dart';
import 'package:faker_generator/services/lists.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Functions {
  Lists _ls = Lists();
  Random _random = Random();

  String phoneNumber() {
    int area = 1 + _random.nextInt(999 - 1);
    int comp = 100 + _random.nextInt(999 - 100);
    int first = 1 + _random.nextInt(999 - 1);
    int second = 1 + _random.nextInt(99 - 1);
    int third = 1 + _random.nextInt(99 - 1);

    String _first = first.toString().length == 2
        ? "0" + first.toString()
        : first.toString().length == 1
            ? "00" + first.toString()
            : first.toString();

    String _second = second.toString().length == 1
        ? "0" + second.toString()
        : second.toString();

    String _third = third.toString().length == 1
        ? "0" + third.toString()
        : third.toString();

    return "+" +
        area.toString() +
        "-(" +
        comp.toString() +
        ")-" +
        _first +
        "-" +
        _second +
        "-" +
        _third;
  }

  String avatar(String gender) {
    int index = 1 + _random.nextInt(99 - 1);
    return "https://randomuser.me/api/portraits/$gender/$index.jpg";
  }

  int age() {
    return 18 + _random.nextInt(60 - 18);
  }

  // UserModel createUser(String gender) {
  //   UserModel user = UserModel(
  //     name: Name(
  //       firstName: ,
  //       lastName: ,
  //     ),
  //   );
  // }
}
