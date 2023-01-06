import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DropDownButton extends StatefulWidget {
  final List<String> list;
  final Function(int) changeDate;
  const DropDownButton({Key? key, required this.list, required this.changeDate})
      : super(key: key);

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
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
      width: size.width * 0.8,
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
            DateTime date = DateFormat('d-MMMM-yyyy').parse(value);
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                date.day.toString() +
                    "/" +
                    date.month.toString() +
                    "/" +
                    date.year.toString(),
                textAlign: TextAlign.center,
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
