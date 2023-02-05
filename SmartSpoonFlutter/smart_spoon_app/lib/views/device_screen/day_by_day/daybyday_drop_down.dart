import 'package:flutter/material.dart';

class DayByDayDropDown extends StatefulWidget {
  final List<String> list;
  final Function(int) changeDate;
  const DayByDayDropDown(
      {Key? key, required this.list, required this.changeDate})
      : super(key: key);

  @override
  State<DayByDayDropDown> createState() => _DayByDayDropDownState();
}

class _DayByDayDropDownState extends State<DayByDayDropDown> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    dropdownValue = (dropdownValue == null) ? widget.list.first : dropdownValue;
    var _theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: _theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.all(15),
      height: size.height * 0.06,
      width: size.width * 0.5,
      child: DropdownButton<String>(
        value: dropdownValue,
        alignment: Alignment.center,
        icon: Icon(Icons.date_range_rounded,
            color: _theme.colorScheme.onBackground),
        elevation: 16,
        style: TextStyle(
          color: _theme.colorScheme.onBackground,
          fontSize: 20,
        ),
        isExpanded: true,
        underline: Container(
          height: 0,
        ),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(
            () {
              dropdownValue = value!;
              widget.changeDate(widget.list.indexOf(value));
            },
          );
        },
        items: widget.list.map<DropdownMenuItem<String>>(
          (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                textAlign: TextAlign.center,
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
