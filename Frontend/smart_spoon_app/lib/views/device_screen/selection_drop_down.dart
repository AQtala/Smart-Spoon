import 'package:flutter/material.dart';
import 'package:smart_spoon_app/enums/selection_enum.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectionDropDown extends StatefulWidget {
  final Function(SelectionEnum) changeSelection;
  const SelectionDropDown({Key? key, required this.changeSelection})
      : super(key: key);

  @override
  State<SelectionDropDown> createState() => _SelectionDropDownState();
}

class _SelectionDropDownState extends State<SelectionDropDown> {
  SelectionEnum? dropdownValue;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    dropdownValue =
        (dropdownValue == null) ? SelectionEnum.dayByDay : dropdownValue;
    var _theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          color: _theme.colorScheme.secondary.withAlpha(255),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: _theme.colorScheme.primary,
                blurRadius: 5,
                spreadRadius: 1)
          ]),
      padding: const EdgeInsets.all(15),
      height: size.height * 0.07,
      width: size.width * 0.8,
      child: DropdownButton<SelectionEnum>(
        value: dropdownValue,
        alignment: Alignment.center,
        icon: Icon(Icons.change_circle_outlined,
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
        onChanged: (SelectionEnum? value) {
          // This is called when the user selects an item.
          setState(
            () {
              dropdownValue = value!;
              widget.changeSelection(value);
            },
          );
        },
        items: SelectionEnum.values
            .map<DropdownMenuItem<SelectionEnum>>(
              (selection) => DropdownMenuItem(
                value: selection,
                child: Text(selection == SelectionEnum.dayByDay
                    ? AppLocalizations.of(context)!.dayByDay
                    : AppLocalizations.of(context)!.compareDays),
              ),
            )
            .toList(),
      ),
    );
  }
}
