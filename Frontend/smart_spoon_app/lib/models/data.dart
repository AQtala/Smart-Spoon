import 'package:fl_chart/fl_chart.dart';

//part 'data.g.dart';

class Data {
  final String title;
  final int numberOfBites;
  List<FlSpot> pitch;
  List<FlSpot> roll;

  Data({
    required this.title,
    required this.numberOfBites,
    required this.pitch,
    required this.roll,
  });

  // factory Data.fromJson(json) =>
  //     _$DataFromJson(Map<String, dynamic>.from(json));

  // Map<String, dynamic> toJson() => _$DataToJson(this);
  // Data copyWith({
  //   String? title,
  //   int? numberOfBites,
  //   List<FlSpot>? pitch,
  //   List<FlSpot>? roll,
  // }) {
  //   return Data(
  //     title: title ?? "",
  //     numberOfBites: numberOfBites ?? 0,
  //     pitch: pitch ?? List.empty(),
  //     roll: roll ?? List.empty(),
  //   );
  // }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Data &&
            title == other.title &&
            numberOfBites == other.numberOfBites &&
            pitch == other.pitch &&
            roll == other.roll);
  }

  @override
  int get hashCode => (title.hashCode + numberOfBites.hashCode);

  @override
  String toString() {
    return "Data($title  $numberOfBites)";
  }
}
