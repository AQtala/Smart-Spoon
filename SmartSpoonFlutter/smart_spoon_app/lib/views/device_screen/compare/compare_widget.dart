import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_spoon_app/enums/selection_enum.dart';
import 'package:smart_spoon_app/models/data.dart';
import 'package:smart_spoon_app/views/device_screen/compare/compare_bar_widget.dart';
import 'package:smart_spoon_app/views/device_screen/compare/custom_date_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../models/bar_spot.dart';

class CompareWidget extends StatefulWidget {
  final SelectionEnum selectionEnum;
  final List<Data> listData;

  const CompareWidget(
      {Key? key, required this.selectionEnum, required this.listData})
      : super(key: key);

  @override
  State<CompareWidget> createState() => _CompareWidgetState();
}

class _CompareWidgetState extends State<CompareWidget> {
  List<BarSpot> bitesData = List.empty();
  List<BarSpot> rollData = List.empty();
  List<BarSpot> pitchData = List.empty();
  List<String> dates = List.empty();

  void updateDates(List<String> list) {
    setState(
      () {
        dates = list;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    prepareData();
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.035,
          ),
          CustomDatePicker(onChangeDate: updateDates),
          CompareBarWidget(
              data: bitesData, title: AppLocalizations.of(context)!.bites),
          CompareBarWidget(
              data: pitchData, title: AppLocalizations.of(context)!.pitch),
          CompareBarWidget(
              data: rollData, title: AppLocalizations.of(context)!.roll),
        ],
      ),
    );
  }

  void prepareData() {
    bitesData = List.empty(growable: true);
    rollData = List.empty(growable: true);
    pitchData = List.empty(growable: true);
    Map<String, Data> listDataMap = {for (var e in widget.listData) e.title: e};
    int id = 1;
    for (var element in dates) {
      if (listDataMap.containsKey(element)) {
        bitesData.add(
          BarSpot(
            x: id,
            y: listDataMap[element]!.numberOfBites.toDouble(),
            title: listDataMap[element]!.title,
          ),
        );
        rollData.add(
          BarSpot(
            x: id,
            y: listDataMap[element]!.roll.fold<double>(
                    0, (previousValue, element) => previousValue + element.y) /
                listDataMap[element]!.roll.length,
            title: listDataMap[element]!.title,
          ),
        );
        pitchData.add(
          BarSpot(
            x: id,
            y: listDataMap[element]!.pitch.fold<double>(
                    0, (previousValue, element) => previousValue + element.y) /
                listDataMap[element]!.pitch.length,
            title: listDataMap[element]!.title,
          ),
        );
      } else {
        bitesData.add(BarSpot(x: id, y: 0, title: element));
        rollData.add(BarSpot(x: id, y: 0, title: element));
        pitchData.add(BarSpot(x: id, y: 0, title: element));
      }
      id++;
    }
    bitesData.sort(
      ((a, b) => DateFormat('yyyy-MM-dd')
              .parse(a.title)
              .difference(DateFormat('yyyy-MM-dd').parse(b.title))
              .isNegative
          ? -1
          : 1),
    );
    rollData.sort(
      ((a, b) => DateFormat('yyyy-MM-dd')
              .parse(a.title)
              .difference(DateFormat('yyyy-MM-dd').parse(b.title))
              .isNegative
          ? -1
          : 1),
    );
    pitchData.sort(
      ((a, b) => DateFormat('yyyy-MM-dd')
              .parse(a.title)
              .difference(DateFormat('yyyy-MM-dd').parse(b.title))
              .isNegative
          ? -1
          : 1),
    );
  }
}
