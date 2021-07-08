import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:mayankpunethainternship/models/data_defination.dart';

class DataProvider with ChangeNotifier {
  List<DataDefination> _items1 = [];

  List<DataDefination> get items1 {
    return [..._items1];
  }
  List<DataDefination> _items2 = [];

  List<DataDefination> get items2 {
    return [..._items2];
  }

  Future<void> fetchData() async {
    final url =
        'https://mayank-punetha-internship-default-rtdb.firebaseio.com/events.json';
    try {
      final response = await http.get(
        Uri.parse(url),
      );
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<DataDefination> _dummy = [];
      extractedData.forEach((key, value) {
        _dummy.add(DataDefination(
          des: value['des'],
          id: key,
          image: value['image'],
          title: value['title'],
        ));
      });
      _items1 = _dummy;
      print(_items1.length);
    } catch (e) {
      print(e);
    }
  }
  Future<void> fetchData2() async {
    final url =
        'https://mayank-punetha-internship-default-rtdb.firebaseio.com/categories.json';
    try {
      final response = await http.get(
        Uri.parse(url),
      );
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<DataDefination> _dummy = [];
      extractedData.forEach((key, value) {
        _dummy.add(DataDefination(
          des: value['des'],
          id: key,
          image: value['image'],
          title: value['title'],
        ));
      });
      _items2 = _dummy;
      print(_items2.length);
    } catch (e) {
      print(e);
    }
  }
}
