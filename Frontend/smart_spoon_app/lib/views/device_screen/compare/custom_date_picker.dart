import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CustomDatePicker extends StatelessWidget {
  final Function(List<String>) onChangeDate;
  const CustomDatePicker({Key? key, required this.onChangeDate})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var _theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
          decoration: BoxDecoration(
            border: Border.all(style: BorderStyle.none, width: 0),
            borderRadius: BorderRadius.circular(10),
            color: _theme.colorScheme.primary.withAlpha(150),
          ),
          child: Text(
            "9 Day Are Allowed",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: _theme.colorScheme.onBackground,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: _theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(15),
          ),
          width: size.width,
          height: size.height * 0.3,
          padding: EdgeInsets.all(size.width * 0.05),
          margin: EdgeInsets.all(size.width * 0.1),
          child: SfDateRangePicker(
            view: DateRangePickerView.year,
            monthViewSettings: const DateRangePickerMonthViewSettings(
              firstDayOfWeek: 6,
            ),
            backgroundColor: _theme.colorScheme.secondary,
            selectionMode: DateRangePickerSelectionMode.multiple,
            onSelectionChanged: _onSelectionChanged,
          ),
        ),
      ],
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value != null) {
      List<String> dates = List.empty(growable: true);
      for (var i = 0; i < args.value.length; i++) {
        dates.add(
          args.value[i].day.toString() +
              "/" +
              args.value[i].month.toString() +
              "/" +
              args.value[i].year.toString(),
        );
      }
      print(dates);
      onChangeDate(dates);
    }
  }
}
