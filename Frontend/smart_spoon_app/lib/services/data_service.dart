import 'dart:convert';
import 'dart:ffi';

import 'package:smart_spoon_app/models/data.dart';
import 'package:http/http.dart' as http;

abstract class DataService {
  Future<List<Data>> getAll();
}

class MyDataService implements DataService {
  @override
  Future<List<Data>> getAll() async {
    const url = 'https://http-demo-17845-default-rtdb.firebaseio.com/data.json';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<Data> result = List.empty(growable: true);
      json.forEach((key, value) {
        List<double> pitch = List.empty(growable: true);
        value['pitch'].forEach((key, value) {
          pitch.add(double.parse(value));
        });
        List<double> roll = List.empty(growable: true);
        value['roll'].forEach((key, value) {
          roll.add(double.parse(value));
        });
        result.add(Data(
          title: key,
          numberOfBites: value['noBites'],
          pitch: pitch,
          roll: roll,
        ));
      });
      print(result);
      return result;
    } else {
      throw "Something went wrong code ${response.statusCode}";
    }
  }
}
