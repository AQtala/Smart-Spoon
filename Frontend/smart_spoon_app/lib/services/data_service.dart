import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
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
      json.forEach(
        (key, value) {
          double time = 0;
          List<FlSpot> pitch = List.empty(growable: true);
          value['pitch'].forEach((key, v) {
            if (v != "nan") {
              pitch.add(FlSpot(time, (double.parse(v))));
              time += 1;
            }
          });
          time = 0;
          List<FlSpot> roll = List.empty(growable: true);
          value['roll'].forEach((key, v) {
            if (v != "nan") {
              roll.add(FlSpot(time, (double.parse(v))));
              time += 1;
            }
          });
          DateTime date = DateFormat('d-MMMM-yyyy').parse(key);
          String stringDate = date.day.toString() +
              "/" +
              date.month.toString() +
              "/" +
              date.year.toString();
          print(stringDate);
          result.add(
            Data(
              title: stringDate,
              numberOfBites: value['noBites'] ?? 0,
              pitch: pitch,
              roll: roll,
            ),
          );
        },
      );
      return result;
    } else {
      throw "Something went wrong code ${response.statusCode}";
    }
  }
}
